class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:update, :checkCurrentUser]
  
  def show
    @user = User.eager_load(:posts).find(params[:id])
    render :template => 'jb/user_detail.json.jb'
  end

  def update
    user = User.find(params[:user][:id])
    name = params[:user][:name]
    email = params[:user][:email]
    introduction = params[:user][:introduction]

    user.update(name: name, email: email, introduction: introduction)
  end

  def check_current_user
    @current_user = current_user
    render :template => 'jb/current_user.json.jb'
  end
end
