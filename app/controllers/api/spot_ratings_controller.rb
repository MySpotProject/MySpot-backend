module Api
    class SpotRatingsController < ApplicationController
        before_action :authenticate_user!

        def like
            if current_user.spot_ratings.find_by(spot_id: params[:id])
                return render json: :already_liked, status: :bad_request
            end
            
            @spot_rating = SpotRating.new(spot_ratings_params.to_h.merge(user_id: current_user.id, spot_id: params[:id]))

            if @spot_rating.save
                UserRating.create(user_id: current_user.id, score: 3, reason: "spot liked")

                render json: @spot_rating, status: :created
            else
                render json: @spot_rating.errors.full_messages    
            end
        end

        def unlike
            if current_user.spot_ratings.find_by(spot_id: params[:id]).nil?
                return render json: :not_liked, status: :bad_request
            end
            
            @spot_rating = SpotRating.find_by(user_id: current_user.id, spot_id: params[:id]).destroy

            UserRating.create(user_id: current_user.id, score: -3, reason: "spot unliked")

            render json: :unliked
        end

        private

        def spot_ratings_params
            params.require(:spot_rating).permit(:rating)
        end
    end    
end
