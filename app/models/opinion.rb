class Opinion < ApplicationRecord
  belongs_to :author, class_name: 'User'

  validates :Text, presence: true
end
