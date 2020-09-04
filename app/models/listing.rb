class Listing < ApplicationRecord
  has_one :skill
  belongs_to :user
  has_many :bookings, dependent: :delete_all
  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :address


  def show_photo
    @search_result = Unsplash::Photo.search(query, page = 1, per_page = 10)
  end
end
