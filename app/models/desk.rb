class Desk < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews

  # Geocoder configuration
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :title, :description, :price_per_hour, :address, presence: true
end
