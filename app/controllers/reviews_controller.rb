class ReviewsController < ApplicationController
  def new
    # @booking = Booking.find(params[:booking_id])
    @listing = Listing.find(params[:listing_id])
    @review = Review.new
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @review = Review.new(review_params)
    @review.user_id = @listing.user.id
    if @review.save
      redirect_to listing_path(@listing)
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
