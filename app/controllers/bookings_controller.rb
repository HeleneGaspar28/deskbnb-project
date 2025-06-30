class BookingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookings = current_user.bookings.includes(:desk)
  end

  def show
    @booking = current_user.bookings.find(params[:id])
  end

  def create
    @booking = current_user.bookings.new(booking_params)

    if @booking.save
      redirect_to bookings_path, notice: "Booking created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @booking = current_user.bookings.find(params[:id])

    if @booking.update(booking_params)
      redirect_to booking_path(@booking), notice: "Booking updated successfully."
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:desk_id, :start_time, :end_time, :status)
  end
end
