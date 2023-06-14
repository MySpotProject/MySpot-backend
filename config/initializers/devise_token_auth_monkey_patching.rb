Rails.configuration.to_prepare do
  DeviseTokenAuth::PasswordsController.class_eval do
    def edit
      # if a user is not found, return nil
      @resource = resource_class.with_reset_password_token(resource_params[:reset_password_token])

      if @resource && @resource.reset_password_period_valid?
        token = @resource.create_token unless require_client_password_reset_token?

        # ensure that user is confirmed
        @resource.skip_confirmation! if confirmable_enabled? && !@resource.confirmed_at
        # allow user to change password once without current_password
        @resource.allow_password_change = true if recoverable_enabled?

        @resource.save!

        yield @resource if block_given?

        if require_client_password_reset_token?
          redirect_to DeviseTokenAuth::Url.generate(@redirect_url, reset_password_token: resource_params[:reset_password_token]), allow_other_host: true
        else
          if DeviseTokenAuth.cookie_enabled
            set_token_in_cookie(@resource, token)
          end

          redirect_header_options = { reset_password: true }
          redirect_headers = build_redirect_headers(token.token, token.client, redirect_header_options)
          redirect_to(@resource.build_auth_url(@redirect_url, redirect_headers))
        end
      else
        render_edit_error
      end
    end
  end

  DeviseTokenAuth::ConfirmationsController.class_eval do
    def show
      @resource = resource_class.confirm_by_token(resource_params[:confirmation_token])

      if @resource.errors.empty?
        yield @resource if block_given?

        redirect_header_options = { account_confirmation_success: true }

        if signed_in?(resource_name)
          token = signed_in_resource.create_token
          signed_in_resource.save!

          redirect_headers = build_redirect_headers(token.token,
                                                    token.client,
                                                    redirect_header_options)

          redirect_to_link = signed_in_resource.build_auth_url(redirect_url, redirect_headers)
        else
          redirect_to_link = DeviseTokenAuth::Url.generate(redirect_url, redirect_header_options)
      end

        redirect_to(redirect_to_link, allow_other_host: true)
      else
        raise ActionController::RoutingError, 'Not Found'
      end
    end
  end
end
