class CommentLikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    comment = Comment.find(params[:comment][:id])
    CommentLike.create(comment_id: comment.id, user_id: current_user.id)
    comment.update(likes_count: comment.comment_likes.size)
  end

  def destroy
    comment = Comment.find(params[:comment][:id])
    current_user.comment_likes.find_by(comment_id: comment.id).destroy
    comment.update(likes_count: comment.comment_likes.size)
  end

end
