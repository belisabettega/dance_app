class ChangeStatusDefaulToTrue < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:bookings, :status, :true)
  end
end
