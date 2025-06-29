class Desk < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, dependent: :destroy

  validates :title, :description, :price_per_hour, :address, presence: true
end
