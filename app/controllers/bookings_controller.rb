class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :edit, :destroy]

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
    @chatroom = @booking.chatroom
    @message = Message.new
    # COMMENTED OUT FOR DEVELOPMENT THIS GENERATES A NEW ROOM FOR EACH BOOKING
    # build_video_call_url
    @room = "https://boomzy.daily.co/qMLWks2AEI4wJhM57bf4"
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
    @listing = Listing.find(params[:listing_id])
    @user = current_user
  end

  def create
    @booking = Booking.new(booking_params)
    @listing = Listing.find(params[:listing_id])
    @booking.listing = @listing
    @booking.user = current_user
    @booking.status = "Pending"
    chatroom = Chatroom.new
    chatroom.booking = @booking
    chatroom.save
    if @booking.save
      redirect_to booking_path(@booking)
      flash[:notice] = "Your booking request has been processed!"
    else
      render :new
    end
  end

  def destroy
    @booking.destroy
    redirect_to account_path
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require("booking").permit(:date, :status)
  end

  def build_video_call_url
      url = URI("https://api.daily.co/v1/rooms")
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Post.new(url)
      request["content-type"] = 'application/json'
      request["authorization"] = "Bearer #{VIDEO_TOKEN}"
      request.body = "{\"properties\":{\"autojoin\":false},\"name\":\"#{@booking.user.authentication_token}#{@booking.id}\"}"

      response = http.request(request)
      if JSON.parse(response.read_body)["info"].include? "already exists"
        @room = "https://boomzy.daily.co/#{@booking.user.authentication_token}#{@booking.id}"
      else
        @room = JSON.parse(response.read_body)["url"]
      end
    end
end
