# frozen_string_literal: true

module Api
    class ProfileController < ApplicationController
        before_action :authenticate_user!

        def upload_avatar
            current_user.avatar.attach(params[:avatar])
            
            render json: :ok
        end
        
        def delete_avatar
            current_user.avatar.attachment.destroy
            
            render json: :ok
        end

        def index; end

        def show
            @user = current_user
        end
    end
end
  