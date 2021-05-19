class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :opinions, foreign_key: "author_id", class_name: 'Opinion' 
  has_many :friendships, foreign_key: "followed_id", class_name: 'friendship'
  has_many :inverse_friendships, foreign_key: "follower_id", class_name: 'friendship'


end
