class DropEventAttandences < ActiveRecord::Migration[6.1]
  def change
    drop_table :event_attendances
  end
end
