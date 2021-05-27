module ApplicationHelper

    # Users who are yet to be followed
    def pending_followers
      partners = [].concat(current_user.followers, current_user.followed_users).map(&:id)
      User.all.reject { |user| current_user.id == user.id || user.id.in?(partners) }
    end
end
