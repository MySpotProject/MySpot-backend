module Api
    class SpotRatingsController < ApplicationController
        before_action :authenticate_user!

        def like
            # byebug
            @spot_rating = SpotRating.new(spot_ratings_params.to_h.merge(user_id: current_user.id, spot_id: params[:id]))

            if @spot_rating.save
                render json: @spot_rating, status: :created
            else
                render json: @spot_rating.errors.full_messages    
            end
        end

        def unlike
            @spot_rating = SpotRating.where(user_id: current_user.id, spot_id: params[:id]).destroy_all
        end

        private

        def spot_ratings_params
            params.require(:spot_rating).permit(:rating)
        end
    end    
end
