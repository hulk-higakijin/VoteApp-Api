class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    post = Post.eager_load(:user, :votes).find(params[:post][:id])
    is_agree = current_user.votes.find_by!(post_id: post.id).is_agree
    current_user.comments.create(post_id: post.id, body: params[:comment][:body], is_agree: is_agree)
  end
end
