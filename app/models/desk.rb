class Desk < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  has_many :bookings
  has_many :reviews, dependent: :destroy

  # Geocoder configuration
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :title, :description, :price_per_hour, :address, presence: true

  #pg search
  include PgSearch::Model
  pg_search_scope :search_by_title_description_and_address,
    against: [ :title, :description, :address ],
    using: {
      tsearch: { prefix: true }
    }
end
