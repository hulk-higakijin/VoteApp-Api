class VotesController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def create
    post = Post.eager_load(:user, :votes).find(params[:post][:id])
    if vote_by_current_user = post.votes.find_by(user_id: current_user.id)
      vote_by_current_user.destroy
    end
    vote = Vote.create(is_agree: params[:post][:is_agree], user_id: current_user.id, post_id: post.id)
    post.update(agree_count: post.votes.where(is_agree: true).length,
                disagree_count: post.votes.where(is_agree: false).length
              )
    render json: vote, status: 200
  end
end
