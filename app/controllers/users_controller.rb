class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.includes(:opinions, :followers, :followed_users).find(params[:id])
  end

  def update
    following_user = Friendship.new(follower_id: current_user.id, followed_id: params[:id])

    if following_user.save
      redirect_to user_path(params[:id])
    else
      flash.now = 'An error occured'
    end
  end
end
