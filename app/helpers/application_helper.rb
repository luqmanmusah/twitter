module ApplicationHelper
  def display_follow_btn?(id)
    user_to_add = id || params[:id]
    already_following = Friendship.where(follower_id: current_user.id, followed_id: user_to_add).first
    puts already_following, 'following!!!!', user_to_add.to_i != current_user.id && already_following.nil?

    user_to_add.to_i != current_user.id && already_following.nil?
  end

  def display_follow_btn(_user)
    link_to 'Follow', user_path(@user), method: :patch, class: 'badge badge-primary'
  end
end
