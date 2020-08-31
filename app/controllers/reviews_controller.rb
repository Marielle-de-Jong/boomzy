class ReviewsController < ApplicationController
  def new
    @user = User.find(params[:id])
    @review = Review.new
  end

  def create
  end


  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
