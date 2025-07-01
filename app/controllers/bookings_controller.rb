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
    @desk = Desk.find(params[:desk_id])
    @booking.desk = @desk

    if @booking.save
      redirect_to bookings_path, notice: "Booking created successfully."
    else
      redirect_to bookings_path, alert: "Booking failed. Please check your input."
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = current_user.bookings.find(params[:id])
    if @booking.update(booking_params)
      redirect_to bookings_path, notice: "Booking updated successfully."
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:desk_id, :start_time, :end_time, :status)
  end
end
