class Desk < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :title, :description, :price_per_hour, :address, presence: true
end
