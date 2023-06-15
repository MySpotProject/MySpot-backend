# frozen_string_literal: true

module Api
  class TricksController < ApplicationController
    # before_action :authenticate_user! only: [:create]
    
    def create
      @trick = Trick.new(trick_params)
      if @trick.save
        render json: @trick, status: :created
      else
        render json: @trick.errors.full_messages
      end
    end
  
    def show
      @trick = Trick.find_by(slug: params[:slug])
    end
  
    def index
      @tricks = Trick.all
    end
    
    private

    def trick_params
      params.require(:trick).permit(:title, :description, :slug, :difficulty, images: [])
    end
  end
end
