# frozen_string_literal: true

module Api
    class SpotsController < ApplicationController
        before_action :authenticate_user!, only: [:create, :top_10]

        def index
            @spots = Spot.all.where(published: true)
        end
    
        def show 
            @spot = Spot.find(params[:id])
        end
        
        def top_10
            @spots = Spot.where(published: true).joins(:spot_ratings).group("spots.id").order("avg(spot_ratings.rating) desc")
        end

        def create
            @spot = Spot.new(spot_params.to_h.merge(author_id: current_user.id, published: false))
            if @spot.save
                @spot.images.attach(spot_params[:images])

                UserRating.create(user_id: current_user.id, score: 25, reason: "spot submit")
                
                render json: @spot, status: :created
            else
                render json: @spot.errors.full_messages    
            end
        end
    
        private
            def spot_params
                params.require(:spot).permit(
                    :title, :description, 
                    :address, :lng,
                    :lat,:figures, :pools, :ramps, :rail, :ladder, :slide, images: []
                )
            end
    end
end
