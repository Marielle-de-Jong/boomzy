class ListingsController < ApplicationController
  before_action :find_listing, only: [:show, :edit, :destroy, :update]

  def index
    @listings = Listing.all
  end

  def show
  end

  def new
    @listing = Listing.new
    search_results = Unsplash::Collection.search("tree", page = 1, per_page = 10)
    collection = search_results.first
    @urls = collection.photos.map { |photo| photo.urls.raw }
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

  private

  def find_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:title, :description, :skill_level)
  end
end
