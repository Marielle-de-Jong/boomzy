class RenameMeetingsToBookings < ActiveRecord::Migration[6.0]
  def change
    rename_table :meetings, :bookings
  end
end
