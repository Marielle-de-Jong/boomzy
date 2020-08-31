class AddStatusToMeetings < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings, :status, :string, default: "Pending"
  end
end
