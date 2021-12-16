class UsersController < ApplicationController
  def show
    u = User.eager_load(:posts).find(params[:id])
    user_array = {
      id: u.id,
      name: u.name,
      uid: u.email,
      introduction: u.introduction,
      posts: u.posts.map do |p| {
          id: p.id,
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

    }
    render json: user_array, status: 200
  end
end
