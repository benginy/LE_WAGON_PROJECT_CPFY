class LifeMomentsController < ApplicationController
  before_action :set_life_moment, only: [:show, :edit, :update, :activate, :deactivate]
  before_action :authenticate_user!, only: [:new, :edit, :activate, :deactivate]

  def index
    if params[:query].present?
      @life_moments = LifeMoment.where(status: :active).search_by_title(params[:query])
    else
      @life_moments = LifeMoment.where(status: :active)
    end

    # Calculate rating for each life_moment (cannot use set_rating here, it doesn't take a parameter and no time to change it)
    @life_moments.each do |life_moment|
      ratings = life_moment.bookings.joins(:review).pluck('reviews.rating')
      life_moment.define_singleton_method(:average_rating) do
        ratings.any? ? (ratings.sum.to_f / ratings.size).round(1) : nil
        end
      end
  end

  def show
    @booking = Booking.new
    calculate_average_rating
  end

  def new
    @life_moment = LifeMoment.new
  end

  def create
    @life_moment = LifeMoment.new(life_moment_params)
    @life_moment.user = current_user
    if @life_moment.save
      redirect_to @life_moment, notice: 'Life moment offer successfully published.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @life_moment.update(life_moment_params)
      redirect_to @life_moment, notice: 'Life Moment was successfully updated.'
    else
      render :edit, alert: 'Unable to update Life Moment.'
    end
  end

  # def destroy
  #   @life_moment.destroy
  #   redirect_to life_moments_url, notice: 'Life moment offer successfully destroyed.'
  # end

  def activate
    if @life_moment.user == current_user
      @life_moment.update(status: "active")
      redirect_to @life_moment, notice: 'Listing activated successfully.'
    else
      redirect_to @life_moment, alert: 'You are not authorized to perform this action.'
    end
  end

  def deactivate
    if @life_moment.user == current_user
      @life_moment.update(status: "inactive")
      redirect_to @life_moment, notice: 'Listing deactivated successfully.'
    else
      redirect_to @life_moment, alert: 'You are not authorized to perform this action.'
    end
  end

  private

  def set_life_moment
    @life_moment = LifeMoment.find(params[:id])
  end

  def life_moment_params
    params.require(:life_moment).permit(:title, :description, :price_per_night, :availability, :image_url, :user_id, :photo)
  end

  def calculate_average_rating
    set_life_moment
    ratings = @life_moment.bookings.joins(:review).pluck('reviews.rating')
    @average_rating = ratings.sum.to_f / ratings.size if ratings.any?
  end
end
