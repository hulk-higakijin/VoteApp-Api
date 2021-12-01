class PostsController < ApplicationController
  def index
    posts = { id:1, topic: "憲法改正するべき？", agree_count: 22, disagree_count: 17, agree_rate: 56.41 }
    render json: posts
  end
end
