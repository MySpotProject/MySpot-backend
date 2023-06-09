
module Api
  class CommentsController < ApplicationController
    before_action :authenticate_user!
    
    def create
      if Comment.find_by(user_id: current_user.id, spot_id: params[:id])
        return render json: :already_commented, status: :bad_request
      end
      @comment = Comment.new(comment_params.to_h.merge(user_id: current_user.id, spot_id: params[:id]))
      if @comment.save
        UserRating.create(user_id: current_user.id, score: 5, reason: "spot comment")

        render json: @comment, status: :created
      else
        render json: @comment.errors.full_messages
      end
    end
  
    def destroy
      if Comment.find_by(user_id: current_user.id, spot_id: params[:id]).nil?
        render json: :no_comments_found, status: :bad_request
      else
        @comment = Comment.find_by(user_id: current_user.id, spot_id: params[:id]).destroy
        UserRating.create(user_id: current_user.id, score: -5, reason: "comment deleted")
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:content)
    end
  end
end
