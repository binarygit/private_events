class RenameUserIdInEventAttendances < ActiveRecord::Migration[6.1]
  def change
    rename_column :event_attendances, :user_id, :attendee_id
  end
end
