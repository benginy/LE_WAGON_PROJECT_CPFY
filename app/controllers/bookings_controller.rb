class BookingsController < ApplicationController
  # before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def create
    @life_moment = LifeMoment.find(params[:life_moment_id])
    @booking = Booking.new(booking_params)
    @booking.life_moment = @life_moment
    @booking.user = current_user
    if @booking.save
      redirect_to dashboard_path, notice: 'Booking was successfully created.'
    else
      redirect_to @life_moment, alert: 'Unable to create booking.'
    end
  end

  def update
    @booking.update(booking_params)
    redirect_to dashboard_path, notice: 'Booking updated successfully'
  end

  def accept
  end

  def decline
  end

  def destroy
    @booking.destroy
    redirect_to dashboard_path, alert: 'Booking deleted successfully'
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :booking_duration, :booking_cost, :status)
  end

  def set_booking
    @booking
  end
end
