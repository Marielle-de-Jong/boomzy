class AccountController < ApplicationController
  def show
    @user = current_user
    @bookings = @user.bookings
    @review = Review.new
  end
end
