class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    p = Post.find(params[:post][:id])
    opinion = current_user.votes.find_by(post_id: p.id).is_agree
    Comment.create(user_id: current_user.id, post_id: p.id, body: params[:comment][:body], is_agree: opinion)
  end
end
