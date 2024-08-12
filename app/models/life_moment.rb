class LifeMoment < ApplicationRecord
  belongs_to :user
  has_many :bookings

  # Validations
  validates :title, :price, presence: true
end
