class PostLikesController < ApplicationController
  def create
    post = Post.find(params[:post][:id])
    PostLike.create(post_id: post.id, user_id: current_user.id)
    post.update(likes_count: post.post_likes.size)
  end

  def destroy
    post = Post.find(params[:post][:id])
    current_user.post_likes.find_by(post_id: post.id).destroy
    post.update(likes_count: post.post_likes.size)
  end

end
