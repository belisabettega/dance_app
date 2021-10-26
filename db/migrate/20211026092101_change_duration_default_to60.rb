class ChangeDurationDefaultTo60 < ActiveRecord::Migration[5.2]
  def change
    change_column :slots, :duration, :integer, default: 60
  end
end
