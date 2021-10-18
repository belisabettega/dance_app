class RemovePriceFromTeachers < ActiveRecord::Migration[5.2]
  def change
    remove_column :teachers, :price, :decimal
  end
end
