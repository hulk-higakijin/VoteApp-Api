class VotesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    post = Post.eager_load(:user, :votes, :comments).find(params[:post][:id])
    if vote_by_current_user = current_user.votes.find_by(post_id: post.id)
      # 既に投票を行っていた場合
      vote = create_vote(post) if vote_by_current_user.is_agree != params[:post][:is_agree]
      vote_by_current_user.destroy!
      current_user.comments.where(post_id: post.id).destroy_all # 意見が変わるのでコメントも消す
    else
      # 初めての投票の場合
      vote = create_vote(post)
    end
    post.update(agree_count: post.votes.where(is_agree: true).length,
                  disagree_count: post.votes.where(is_agree: false).length
                )
    render json: vote, status: 200
  end

  private

    def create_vote(post)
      current_user.votes.create(is_agree: params[:post][:is_agree], post_id: post.id)
    end
end
