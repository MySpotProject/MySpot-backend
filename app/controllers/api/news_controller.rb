
module Api
  class NewsController < ApplicationController
    def create
      @news = News.new(news_params)

      if @news.save
        render json: @news, status: :created
      else
        render json: @news.errors.full_messages
      end
    end
  
    def show
      @news = News.all
    end
  
    def index
      @news = News.find(params[:id])
    end

    private

    def news_params
      params.require(:news).permit(:title, :description, images: [])
    end
  end
end
