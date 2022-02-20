class ChangeColumnNameToAttendeeId < ActiveRecord::Migration[6.1]
  def change
    change_column :event_attendances, :user_id, :attendee_id
  end
end
