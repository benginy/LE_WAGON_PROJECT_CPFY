class ReviewsController < ApplicationController

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking

    if @review.save
      redirect_to booking_path(@booking), notice: 'Review was successfully created.'
    else
      render :new, alert: 'There was an error creating your review.'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
