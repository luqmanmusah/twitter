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

  def update_profile
    if current_user.update(account_update_params.except(:photo))
      current_user.photo.attach(account_update_params[:photo])
      redirect_to user_path(current_user)
    else
      render 'profile'
    end
  end

  def profile
    @user = current_user
  end

  private

  def account_update_params
    params.require(:user).permit(:username, :fullname, :email,
                                 :photo)
  end
end
