class PostLikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  
  def create
    post = Post.find(params[:post][:id])
    PostLike.create(post_id: post.id, user_id: current_user.id)
  end

  def destroy
    post = Post.find(params[:post][:id])
    current_user.post_likes.find_by(post_id: post.id).destroy
  end

end
