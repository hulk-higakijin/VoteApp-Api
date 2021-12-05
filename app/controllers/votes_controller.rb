class VotesController < ApplicationController
  def create
    post = Post.find(params[:post][:id])
    if vote = Vote.create(is_agree: params[:post][:is_agree],
                        user_id: current_user.id,
                        post_id: post.id
                      )
      if params[:post][:is_agree] == true
        post.update(agree_count: post.agree_count + 1)
      elsif params[:post][:is_agree] == false
        post.update(disagree_count: post.disagree_count + 1)
      end
    end
    render json: vote, status: 200
  end
end
