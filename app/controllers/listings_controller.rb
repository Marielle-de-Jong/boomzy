class ListingsController < ApplicationController
  before_action :find_listing, only: [:show, :edit, :destroy, :update, :add_image, :post_add_image]

  def index
    @listings = Listing.all
  end

  def show
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
      search_results = Unsplash::Collection.search(params[:listing][:image_keyword], page = 1, per_page = 10)
      if search_results.any?
        collection = search_results.first
        @urls = collection.photos.map { |photo| photo.urls.small }
      else
        @urls = []
      end
    # else
    #   search_results = Unsplash::Collection.search(params[:listing][:image_keyword], page = 1, per_page = 10)
    #   collection = search_results.first
    #   @urls = collection.photos.map { |photo| photo.urls.small }
    else
      @urls = []
    end
  end

  def post_add_image
    @listing.listing_image = params[:listing][:listing_image]
    @listing.save
    redirect_to listing_path(@listing)
  end

  private

  def find_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:title, :description, :skill_level)
  end
end
