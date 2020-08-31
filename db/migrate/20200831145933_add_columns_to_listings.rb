class AddColumnsToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :skill_level, :string
    add_column :listings, :description, :text
    add_column :listings, :title, :string
  end
end
