class AccountController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = current_user
    @listings = @user.listings
    @bookings = @user.bookings
    @review = Review.new
    @skill = Skill.new
  end

  def update
    @user = User.find_by(email: params[:user][:email])
    @user.update(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :bio, :facebook_link, :instagram_link,
                                 :motivation, :twitter_link, :linkedin_link, :date_of_birth,
                                 address_attributes: [:id, :city, :postcode, :address_line_1, :address_line_2,
                                 :addressable_id, :addressable_type],
                                 skill_attributes: [:name, :category])
  end
end
