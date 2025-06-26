class DesksController < ApplicationController
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

  private

  def desk_params
    params.require(:desk).permit(:title, :description, :price_per_hour, :address)
  end
end
