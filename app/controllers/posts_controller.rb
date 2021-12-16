class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :unpublished, :destroy, :checkCurrentUser]

  def index
    posts = Post.all.eager_load(:user, :votes)
    posts_array = posts.map do |p|
      {
        id: p.id,
        user_id: p.user.id,
        uid: p.user.email,
        name: p.user.name,
        topic: p.topic,
        agree_count: p.agree_count,
        disagree_count: p.disagree_count,
        likes_count: p.likes_count,
        is_published: p.is_published,
        created_at: p.created_at,
        votes: p.votes.map do |v| {
          id: v.id,
          uid: v.user.email,
          is_agree: v.is_agree
        }
        end,
        likes: p.post_likes.map do |l| {
          id: l.id,
          uid: l.user.email
        } 
        end
      }
    end
    render json: posts_array, status: 200
  end

  def show
    p = Post.eager_load(:user, :votes, :comments).find(params[:id])
    post_array = {
      id: p.id,
      user_id: p.user_id,
      uid: p.user.email,
      name: p.user.name,
      topic: p.topic,
      agree_count: p.agree_count,
      disagree_count: p.disagree_count,
      likes_count: p.likes_count,
      is_published: p.is_published,
      created_at: p.created_at,
      votes: p.votes.map do |v| {
          id: v.id,
          uid: v.user.email,
          is_agree: v.is_agree
        }
      end,
      comments: p.comments.map do |c| {
          id: c.id,
          user_id: c.user.id,
          name: c.user.name,
          is_agree: c.is_agree,
          body: c.body,
          likes_count: c.likes_count,
          likes: c.comment_likes.map do |l| {
              id: l.id,
              uid: l.user.email
            }
          end
        }
      end,
      likes: p.post_likes.map do |l| {
          id: l.id,
          uid: l.user.email
        }
      end
    }
    render json: post_array, status: 200
  end

  def create
    post = Post.create(topic: params[:post][:topic],
                        user_id: current_user.id,
                        is_published: params[:post][:published]
                      )
  end

  def unpublished
    post = Post.find(params[:post][:id])
    post.update(is_published: true) if !post.is_published
  end

  def destroy
    post = Post.find(params[:post][:id])
    post.destroy
  end

  # いらないかも
  def checkCurrentUser
    u = current_user
    user_array = {
      id: u.id,
      uid: u.email,
      name: u.name,
      introduction: u.introduction
    }
    render json: user_array, status: 200
  end
end
