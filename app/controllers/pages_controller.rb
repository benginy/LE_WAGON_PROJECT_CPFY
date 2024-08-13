class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]
  def home
  end

  def dashboard
    @bookings_made = Booking.where(user: current_user)

    @published_life_moments = LifeMoment.where(user: current_user)

    # Find bookings for these Life Moments
    @bookings_sold = Booking.where(life_moment: @published_life_moments)
  end
end
