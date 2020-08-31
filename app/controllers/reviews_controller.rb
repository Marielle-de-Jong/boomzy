class ReviewsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    booking = Booking.find(params[:booking_id])
    @review.booking = booking
    if @review.save
      redirect_to booking_path(booking)
      flash[:alert] = "Review created."
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end

