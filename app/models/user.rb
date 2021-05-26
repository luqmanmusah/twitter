class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :opinions, foreign_key: "author_id", class_name: 'Opinion' 

  has_many :friendships, foreign_key: "followed_id", :class_name => 'Friendship'
  has_many :followers, through: :friendships, source: :follower

  has_many :inverse_friendships, foreign_key: "follower_id", :class_name => 'Friendship'
  has_many :followed_users, through: :inverse_friendships, source: :followed
  has_one_attached :photo

  scope :most_recent, -> { order(created_at: :desc) }
end

def followers
  followers_array = friendships.map{|friendship| friendship.follower if friendship.confirmed}
  followers_array + inverse_friendships.map{|friendship| friendship.user if friendship.confirmed}
  followers_array.compact
end

# Users who are yet to be followed
def pending_followers
  partners = [].concat(current_user.followers, current_user.followed_users).map(&:id)
  User.all.reject { |user| current_user.id == user.id || user.id.in?(partners) }
end

# Users who have requested to be followers
def follower_requests
  inverse_friendships.map{|friendship| friendship.user if !friendship.confirmed}.compact
end

def confirm_follower(user)
  friendship = inverse_friendships.find{|friendship| friendship.user == user}
  friendship.confirmed = true
  friendship.save
end

def follower?(user)
  followers.include?(user)
end