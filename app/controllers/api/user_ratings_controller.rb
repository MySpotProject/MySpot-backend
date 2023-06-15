
module Api
  class UserRatingsController < ApplicationController
    before_action :authenticate_user!

    def show
      @user_ratings = UserRating.all
    end

    def index
      @user_ratings = UserRating.where(user_id: current_user.id)
    end
    
    private
    
    def user_rating_params
      params.require(:user_rating).permit(:score, :reason)
    end
  end
end
