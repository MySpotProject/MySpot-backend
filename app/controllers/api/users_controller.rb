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

    def top_10
      @user_ratings = UserRating.order(score: :desc).limit(10)
    end

    def index
      @users = User.all
    end

    def show
      @user = User.find_by(nickname: params[:nickname])
    end
  end
end
