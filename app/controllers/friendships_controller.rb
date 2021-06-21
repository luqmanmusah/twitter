class FriendshipsController < ApplicationController
  def create
    id1 = params[:ids][:id1]
    id2 = params[:ids][:id2]
    @friendship = Friendship.new(followed_id: id1, follower_id: id2)
    @friendship.save
    redirect_to users_path
  end

  def destroy
    friendship = Friendship.find(params[:friendship_id])
    friendship.destroy
    redirect_to user_path(current_user.id)
  end

  def update
    friendship = Friendship.find(params[:friendship_id])
    current_user
    friendship.update(confirmed: true)
    redirect_to user_path(friendship.follower_id)
  end

  # def create
  #   @friendship = Current.user.friendships.new(followed_id: params[:user_id])
  #   if @friendship.save
  #       flash[:notice] = "You are following #{User.find(params[:user_id]).full_name}"
  #   else
  #       flash[:alert] = 'Something went wrong ...'
  #   end
  #   redirect_to root_path
  # end
end
