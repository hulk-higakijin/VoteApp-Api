class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def current_user
    @current_user ||= User.find_by(email: params['uid']) if params['uid']
  end

  def index
    posts = { id:1, topic: "憲法改正するべき？", agree_count: 22, disagree_count: 17, agree_rate: 56.41 }
    posts = Post.all
    render json: posts
  end

  # def show
  #   post = Post.find(paramd[:id])

  # end

  def create
    post = Post.create(topic: params[:post][:topic], user_id: current_user.id, is_published: params[:post][:published])
  end
end
