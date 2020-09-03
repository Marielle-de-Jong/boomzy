class Listing < ApplicationRecord
  has_many :skills
  belongs_to :user
  has_many :bookings, dependent: :delete_all

  def show_photo
    @search_result = Unsplash::Photo.search(query, page = 1, per_page = 10)
  end

end
