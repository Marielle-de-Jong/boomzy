class AddDescriptionToUserSkill < ActiveRecord::Migration[6.0]
  def change
    add_column :user_skills, :description, :text
  end
end
