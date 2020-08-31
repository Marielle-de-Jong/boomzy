class DropUserSkills < ActiveRecord::Migration[6.0]
  def change
    drop_table :user_skills
  end
end
