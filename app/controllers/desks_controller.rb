class DesksController < ApplicationController
  def index
    if params[:query].present?
      @desks = Desk.search_by_title_description_and_address(params[:query])
    else
      @desks = Desk.all
    end

    @markers = @desks.geocoded.map do |desk|
      {
        lat: desk.latitude,
        lng: desk.longitude,
        info_window: render_to_string(partial: "desks/info_window", locals: { desk: desk })
      }
    end
  end

  def show
    @desk = Desk.find(params[:id])
    @booking = Booking.new
  end

  def new
    @desk = Desk.new
  end

  def create
    if current_user != nil
      @desk = Desk.new(desk_params)
      @desk.user = current_user

      if @desk.save
        redirect_to desk_path(@desk), notice: "Desk created successfully."
      else
        render :new, status: :unprocessable_entity
      end
    else
      redirect_to user_session_path, notice: "You have to login to create a desk."
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
