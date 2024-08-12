class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :life_moment
  has_one :review, dependent: :destroy
end
