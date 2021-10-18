class CreateSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :slots do |t|
      t.references :teacher, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.integer :duration
      t.boolean :provisional

      t.timestamps
    end
  end
end
