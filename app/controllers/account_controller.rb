class AccountController < ApplicationController
  def show
    @user = current_user
    @listings = @user.listings
    @bookings = @user.bookings
    @review = Review.new
  end
end
