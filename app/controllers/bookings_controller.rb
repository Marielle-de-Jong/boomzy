class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :edit, :destroy]

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def status?
    @booking.status
  end

  def cancel
    @booking.status = "Cancelled"
    @booking.save
    flash[:notice] = "You have cancelled this booking request"
    redirect_back(fallback_location: root_path)
  end

  def confirm
    @booking.status = "Accepted"
    @booking.save
    flash[:notice] = "You have accepted the pending booking request"
    redirect_back(fallback_location: root_path)
  end

  def decline
    @booking.status = "Declined"
    @booking.save
    flash[:notice] = "You have declined pending booking request"
    redirect_back(fallback_location: root_path)
  end

  def new
    @booking = Booking.new
    # @skill = Skill.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.skill = Skill.find(params[:skill_id])
    @booking.user = current_user
    @booking.status = "Pending"

    if @booking.save
      redirect_to account_path
      flash[:notice] = "Your booking request has been processed!"
    else
      render :new
    end
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require("booking").permit(:start_date, :end_date)
  end
end
