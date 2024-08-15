class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :life_moment
  has_one :review, dependent: :destroy

  validates :start_date, presence: true
  validates :end_date, presence: true

  # Status enum for Booking
  enum status: { pending: 0, accepted: 1, rejected: 2 }
end
