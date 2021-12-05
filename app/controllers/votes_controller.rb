class VotesController < ApplicationController
  def create
    post = Post.find(params[:post][:id])
    votes = post.votes
    if vote_by_current_user = votes.where(user_id: current_user.id)
      vote_by_current_user.delete_all
    end
    vote = Vote.create(is_agree: params[:post][:is_agree], user_id: current_user.id, post_id: post.id)
    post.update(agree_count: votes.where(is_agree: true).length,
                disagree_count: votes.where(is_agree: false).length
              )
    render json: vote, status: 200
  end
end
