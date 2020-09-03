class ListingsController < ApplicationController
  before_action :find_listing, only: [:show, :edit, :destroy, :update, :add_image]

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
    search_results = Unsplash::Collection.search("kickboxing", page = 1, per_page = 10)
    collection = search_results.first
    @urls = collection.photos.map { |photo| photo.urls.raw }
  end

  private

  def find_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:title, :description, :skill_level)
  end
end
