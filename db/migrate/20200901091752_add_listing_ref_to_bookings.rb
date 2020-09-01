class AddListingRefToBookings < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :listing, null: false, foreign_key: true
  end
end
