# frozen_string_literal: true

module Api
    class SpotsController < ApplicationController
        # before_action :authenticate_user!, only: [:create]

        def index
            @spots = Spot.all
        end
    
        def show 
            @spot = Spot.find(params[:id])
            # @spot.spot_ratings.average(:rating).to_f.round(2)
        end
    
        def create
            @spot = Spot.new(spot_params.merge(author_id: current_user.id))
            
            if @spot.save
                @spot.images.attach(spot_params[:images])
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
