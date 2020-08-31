class RemoveStatusFromMeetings < ActiveRecord::Migration[6.0]
  def change
    remove_column :meetings, :status, :string
  end
end
