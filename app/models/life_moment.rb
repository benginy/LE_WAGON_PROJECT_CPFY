class LifeMoment < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  # photo for upload by user
  has_one_attached :photo

  # Validations
  validates :title, :price_per_night, presence: true

  # Search Bar
  include PgSearch::Model
  pg_search_scope :search_by_title,
    against: [ :title, :description ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  # Status enum for LifeMoment
  enum status: { active: 0, inactive: 1 }
end
