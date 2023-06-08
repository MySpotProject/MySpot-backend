
module Api
  class UserRatingsController < ApplicationController
    before_action :authenticate_user!
    # def user_score
    #   # byebug
    #   @user_rating = UserRating.new(user_rating_params.to_h.merge(user_id: current_user.id))

    #   if @user_rating.save
    #     render json: @user_rating, status: :created
    #   else
    #     render json: @user_rating.errors.full_messages
    #   end
    # end
  
    # def show
    #   @user_ratings = UserRating.all
    # end
    
    def index
      @user_ratings = UserRating.where(user_id: current_user.id)
    end
    
    private
    
    def user_rating_params
      params.require(:user_rating).permit(:score, :reason)
    end
  end
end
