module ApplicationHelper
    def add_friend(user)
        if signed_in? && !Friendship.create?(current_user.id, user.id) && current_user != user
          button_to 'Add Friend',
                    friendships_create_path(ids: { id1: current_user.id, id2: follower.id })
        end
      end
    
      def un_friend(user)
        if user == current_user
          content_tag(:ul) do
            user.followers.each do |follower|
              concat content_tag(:li, (button_to 'Unfriend',
                                                 friendships_destroy_path(friendship_id: Friendship.find_friendship(
                                                   @user.id, follower.id
                                                 ))) + follower.name.to_s)
            end
          end
        end
      end
    
      def accept(user)
        if user == current_user
          content_tag(:ul) do
            user.follower_requests.each do |friendship|
              concat content_tag(:li, (button_to 'Accept',
                                                 friendships_update_path(friendship_id: friendship.id), data: { disable_with: 'Followers' }) +
                                      (button_to 'Reject',
                                                 friendships_destroy_path(friendship_id: friendship.id)) +
                                      "#{User.find(friendship.user_id).name} Wants to be your follower")
            end
          end
        end
      end
end
