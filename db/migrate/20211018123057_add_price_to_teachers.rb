class AddPriceToTeachers < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :price, :float
  end
end
