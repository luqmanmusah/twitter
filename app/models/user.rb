class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, length: { minimum: 3 }
  validates :email, presence: true, length: { minimum: 10 }

  has_many :opinions, foreign_key: 'author_id', class_name: 'Opinion', dependent: :destroy

  has_many :friendships, foreign_key: 'followed_id', class_name: 'Friendship'
  has_many :followers, through: :friendships, source: :follower

  has_many :inverse_friendships, foreign_key: 'follower_id', class_name: 'Friendship'
  has_many :followed_users, through: :inverse_friendships, source: :followed
  has_one_attached :photo

  scope :most_recent, -> { order(created_at: :desc) }
end

# Users who are yet to be followed
def pending_followers
  partners = [].concat(current_user.followers, current_user.followed_users).map(&:id)
  User.all.reject { |user| current_user.id == user.id || user.id.in?(partners) }
end
