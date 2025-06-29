class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @desk = Desk.find(params[:desk_id])
  end

  def create
    @review = Review.new(review_params)
    @desk = Desk.find(params[:desk_id])
    @review.desk = @desk
    @review.user_id = current_user.id
    if @review.save
      redirect_to desk_path(@desk)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.user_id == current_user.id
      @review.destroy
      redirect_to desk_path(@review.desk), status: :see_other
    else
      flash[:alert] = 'You are not authorized to delete this review.'
      redirect_to desk_path(@review.desk)
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
