Rails.configuration.to_prepare do
  DeviseTokenAuth::PasswordsController.class_eval do
    def create
      return render_create_error_missing_email unless resource_params[:email]

      @email = get_case_insensitive_field_from_resource_params(:email)
      @resource = find_resource(:uid, @email)

      if @resource
        yield @resource if block_given?
        @resource.send_reset_password_instructions(
          email: @email,
          provider: 'email',
          redirect_url: @redirect_url,
          client_config: params[:config_name],
          from: ENV["EMAIL_FROM"]
        )

        if @resource.errors.empty?
          return render_create_success
        else
          render_create_error @resource.errors
        end
      else
        render_not_found_error
      end
    end

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

    def create
      return render_create_error_missing_email if resource_params[:email].blank?

      @email = get_case_insensitive_field_from_resource_params(:email)

      @resource = resource_class.dta_find_by(uid: @email, provider: provider)

      return render_not_found_error unless @resource

      @resource.send_confirmation_instructions({
        redirect_url: redirect_url,
        client_config: resource_params[:config_name],
        from: ENV["EMAIL_FROM"]
      })

      return render_create_success
    end
  end
end
