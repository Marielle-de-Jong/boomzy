class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :address, :string
    add_column :users, :bio, :text
    add_column :users, :linkedin_link, :string
    add_column :users, :twitter_link, :string
    add_column :users, :instagram_link, :string
    add_column :users, :facebook_link, :string
  end
end
