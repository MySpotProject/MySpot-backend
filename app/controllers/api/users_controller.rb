# frozen_string_literal: true

module Api
  class UsersController < ApplicationController
    def new
    end

    def create
    end

    def update
    end

    def destroy
    end

    def index
      @users = User.all
    end

    def show
      @user = User.find_by(nickname: params[:nickname])
    end
  end
end
