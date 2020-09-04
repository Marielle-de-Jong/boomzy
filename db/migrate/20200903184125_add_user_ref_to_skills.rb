class AddUserRefToSkills < ActiveRecord::Migration[6.0]
  def change
    add_reference :skills, :user, foreign_key: true
  end
end
