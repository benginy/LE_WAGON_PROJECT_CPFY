class LifeMoment < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  # Validations
  validates :title, :price, presence: true
end
