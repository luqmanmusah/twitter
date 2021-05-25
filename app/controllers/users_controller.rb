class UsersController < ApplicationController
    def index
        @users = User.all
        # @user = User.find_by(id: current_user.id)
        # partners = [].concat(current_user.followers, current_user.followed_users).map(&:id)
        # @users_to_follow = User.all.reject { |user| current_user.id == user.id || user.id.in?(partners) }
        # @opinions = Opinion.includes(:author).all.most_recent.select do |opinion|
        #   opinion_id = opinion.author.id
        #   opinion_id.in?(partners) || opinion_id == current_user.id
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

