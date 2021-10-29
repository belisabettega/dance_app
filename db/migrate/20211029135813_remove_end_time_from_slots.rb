class RemoveEndTimeFromSlots < ActiveRecord::Migration[5.2]
  def change
    remove_column :slots, :end_time, :datetime
  end
end
