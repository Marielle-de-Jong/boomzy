class AddColumnsToListing < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :listing_image, :string
    add_column :listings, :image_keyword, :string
  end
end
