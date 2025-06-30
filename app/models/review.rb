class Review < ApplicationRecord
  belongs_to :desk
  belongs_to :user

  validates :comment, :rating, presence: true
end
