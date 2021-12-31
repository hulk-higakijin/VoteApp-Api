class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :unpublished, :destroy]

  def index
    @posts = Post.all.eager_load(:user, :votes).order(id: "DESC")
    render :template => 'jb/posts.json.jb'
  end

  def show
    @post = Post.eager_load(:user, :votes, :comments).find(params[:id])
    render :template => 'jb/post_detail.json.jb'
  end

  def create
    current_user.posts.create(topic: params[:post][:topic], is_published: params[:post][:published])
  end

  def to_published
    post = current_user.posts.find(params[:post][:id])
    post.update!(is_published: true) if !post.is_published
  end

  def destroy
    current_user.posts.find(params[:post][:id]).destroy!
  end

end
