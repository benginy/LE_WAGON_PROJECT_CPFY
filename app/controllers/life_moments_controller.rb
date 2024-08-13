class LifeMomentsController < ApplicationController
  before_action :set_life_moment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    if params[:query].present?
      @life_moments = LifeMoment.where('title LIKE ?', "%#{params[:query]}%")
    else
      @life_moments = LifeMoment.all
    end
  end

  def show
    @booking = Booking.new
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
      redirect_to @life_moment, notice: 'Life moment successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @life_moment.destroy
    redirect_to life_moments_url, notice: 'Life moment offer successfully destroyed.'
  end

  private

  def set_life_moment
    @life_moment = LifeMoment.find(params[:id])
  end

  def life_moment_params
    params.require(:life_moment).permit(:title, :description, :price_per_night, :availability, :image_url, :user_id, :photo)
  end
end
