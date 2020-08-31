class AddTitleToUserSkills < ActiveRecord::Migration[6.0]
  def change
    add_column :user_skills, :title, :string
  end
end
