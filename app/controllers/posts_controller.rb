class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    # posts = { id:1, topic: "憲法改正するべき？", agree_count: 22, disagree_count: 17, agree_rate: 56.41 }
    posts = Post.all.includes(:user)
    posts_array = posts.map do |p|
      {
        id: p.id,
        user_id: p.user.id,
        name: p.user.name,
        topic: p.topic,
        agree_count: p.agree_count,
        disagree_count: p.disagree_count,
        is_published: p.is_published,
        created_at: p.created_at
      }
    end
    render json: posts_array, status: 200
  end

  def show
    p = Post.find(params[:id])
    post_array = {
      id: p.id,
      user_id: p.user_id,
      name: p.user.name,
      topic: p.topic,
      agree_count: p.agree_count,
      disagree_count: p.disagree_count,
      is_published: p.is_published,
      created_at: p.created_at
    }
    render json: post_array, status: 200
  end

  def create
    post = Post.create(topic: params[:post][:topic],
                        user_id: current_user.id,
                        is_published: params[:post][:published]
                      )
  end
end
