class DesksController < ApplicationController
  def index
    @desks = Desk.all
  end

  def show
    @desk = Desk.find(params[:id])
    @booking = Booking.new
  end

  def new
    @desk = Desk.new
  end

  def create
    @desk = Desk.new(desk_params)
    @desk.user = current_user

    if @desk.save
      redirect_to new_desk_path, notice: "Desk created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @desk = Desk.find(params[:id])
    if @desk.update(desk_params)
      redirect_to @desk, notice: 'Desk was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def mydesks
    @desks = current_user.desks
  end

  private

  def desk_params
    params.require(:desk).permit(:title, :description, :price_per_hour, :address)
  end
end
