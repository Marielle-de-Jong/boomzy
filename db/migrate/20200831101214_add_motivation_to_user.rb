class AddMotivationToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :motivation, :text
  end
end
