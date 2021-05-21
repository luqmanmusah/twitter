class UsersController < ApplicationController
    def index
        @users = User.all
    end
    def show
        @user = User.includes(:opinions, :friendships, :inverse_friendships).find(params[:id])
    end
    
    def update
        following_user = Following.new(follower_id: current_user.id, followed_id: params[:id])
    
        if following_user.save
          redirect_to user_path(params[:id])
        else
          flash.now = 'An error occured'
        end
      end
end
