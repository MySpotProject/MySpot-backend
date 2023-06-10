# frozen_string_literal: true

module Api
    class ProfileController < ApplicationController
        before_action :authenticate_user!

        def upload_avatar
            current_user.avatar.attach(params[:avatar])
            
            if current_user.save
                render json: :uploaded
            else
                render json: current_user.errors.full_messages
            end
        end
        
        def delete_avatar
            if current_user.avatar.attachment.destroy
                render json: :deleted_avatar
            else
                render json: current_user.errors.full_messages
            end
        end

        def update
            if current_user.update(current_user_params)
                # byebug
                render json: :updated
            else
                render json: current_user.errors.full_messages
            end
        end

        def show
            @user = current_user
        end

        private

        def current_user_params
            params.require(:user).permit(:email, :name, :nickname, :vk, :tg, :mail)
        end
    end
end
  