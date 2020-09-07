class Listing < ApplicationRecord
  belongs_to :skill
  belongs_to :user
  has_many :bookings, dependent: :delete_all
  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :address


  include PgSearch::Model
  pg_search_scope :search_by_address,
    associated_against: {
      address: [ :city, :address_line_1, :address_line_2, :postcode ]
    },
    using: {
      tsearch: { prefix: true }
    }

  def show_photo
    @search_result = Unsplash::Photo.search(query, page = 1, per_page = 10)
  end
end

