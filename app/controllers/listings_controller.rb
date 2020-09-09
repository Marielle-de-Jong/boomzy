class ListingsController < ApplicationController
  before_action :find_listing, only: [:show, :edit, :destroy, :update, :add_image, :post_add_image]
  skip_before_action :authenticate_user!, only: [:index, :show]


  def index
    if params[:address].present?
      @listings = Listing.search_by_address(params[:address])
    else
      @listings = Listing.all
    end

    if params[:skill].present?
      @listings = @listings.joins(:skill).where(skills: {category: params[:skill]})
    else
      @listings = @listings
    end

    @listing_addresses = Address.where(addressable_type: "Listing")
    @markers = @listing_addresses.geocoded.map do |address|
      {
        lat: address.latitude,
        lng: address.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { address: address }),
        image_url: helpers.asset_url('icons/sewing-machine.svg')

      }
    end

  end

  def show
    @booking = Booking.new
    @review = Review.new
    if @listing.user.reviews.length > 0
      @average_rating = @listing.user.average_rating(@listing.user)
    else
      @average_rating = "No reviews."
    end
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    if @listing.save
      redirect_to account_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @listing.update(listing_params)
      redirect_to account_path
    else
      render :new
    end
  end

  def destroy
    @listing.destroy
    redirect_to account_path
  end

  def add_image
    if params[:listing]
      search_results = Unsplash::Collection.search(params[:listing][:image_keyword])
      if search_results.any?
        collection = search_results.first
        @urls = collection.photos.first(9).map { |photo| photo.urls.small }
      else
        @urls = []
      end
    else
      @urls = []
    end
  end

  def post_add_image
    @listing.listing_image = params[:listing][:listing_image].gsub("400", "1080")
    @listing.save
    redirect_to listing_path(@listing)
  end

  private

  def find_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:title, :description, :skill_level, address_attributes: [:address_line_1, :address_line_2, :city, :postcode], skill_attributes: [:name, :category])
  end
end
