class CreateMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :meetings do |t|
      t.date :date
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
