class CommentLikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    comment = Comment.find(params[:comment][:id])
    current_user.comment_likes.create(comment_id: comment.id)
  end

  def destroy
    comment = Comment.find(params[:comment][:id])
    current_user.comment_likes.find_by!(comment_id: comment.id).destroy
  end

end
