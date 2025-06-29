class Review < ApplicationRecord
  belongs_to :desk
  belongs_to :user
end
