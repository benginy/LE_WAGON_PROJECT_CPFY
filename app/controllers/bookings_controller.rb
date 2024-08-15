class BookingsController < ApplicationController
  # before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def show
    set_booking
    @review = Review.new
    @role = determine_role
    p "---------------"
    p @role
    p "---------------"

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
    set_booking
    @booking.update(booking_params)
    redirect_to dashboard_path, notice: 'Booking updated successfully'
  end

  def accept
    set_booking
    @booking.status = :accepted
    if @booking.save
      redirect_to dashboard_path, notice: 'Booking accepted'
    else
      redirect_to dashboard_path, notice: 'Unable to update Booking status'
    end
  end

  def decline
    set_booking
    @booking.status = :rejected
    if @booking.save
      redirect_to dashboard_path, notice: 'Booking rejected'
    else
      redirect_to dashboard_path, notice: 'Unable to update Booking status'
    end
  end

  def destroy
    set_booking
    @booking.destroy
    redirect_to dashboard_path, alert: 'Booking deleted successfully'
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :booking_duration, :booking_cost, :status)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def determine_role
    if current_user == @booking.user
      'buyer'
    elsif current_user == @booking.life_moment.user
      'seller'
    else
      'unauthorized'
    end
  end

end
