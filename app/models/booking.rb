class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :desk

  validates :start_time, :end_time, :status, presence: true

  enum :status, { pending: 0, accepted: 1, declined: 2, cancelled: 3 }
end
