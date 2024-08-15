class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #relations avec autres modeles

  has_many :life_moments
  has_many :bookings
  has_many :reviews, through: :life_moments


    # Validations
    validates :username, presence: true, uniqueness: true
    # validates :profile_picture_url, format: { with: URI::regexp(%w[http https]), message: "must be a valid URL" }
    validates :bio, length: { maximum: 500 }
    # validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

end
