class LifeMoment < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  # has_many :reviews, through: :bookings

  # photo for upload by user
  has_one_attached :photo

  # Validations
  validates :title, :price_per_night, presence: true
end
