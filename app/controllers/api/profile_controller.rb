# frozen_string_literal: true

module Api
    class ProfileController < ApplicationController
        def upload_avatar
            current_user.avatar.attach(params[:avatar])
            
            render json: :ok
        end
    end
end
  