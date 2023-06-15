# frozen_string_literal: true

module Api
  class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:top_10]

    def top_10
      @users = User.joins(:user_ratings).group("users.id").order("sum(user_ratings.score) desc").limit(10)
    end

    def index
      @user = User.find(params[:id])
    end

    def show
      @user = User.find_by(nickname: params[:nickname])
    end
  end
end
