class Review < ApplicationRecord
  belongs_to :booking
  has_one :life_moment, through: :booking

  # Validations
  validates :rating, presence: true
  validates :comment, presence: true, length: { maximum: 500 }
end
