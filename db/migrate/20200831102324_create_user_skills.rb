class CreateUserSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :user_skills do |t|
      t.string :skill_level

      t.timestamps
    end
  end
end
