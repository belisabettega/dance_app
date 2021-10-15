class AddDetailsToTeachers < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :description, :text
    add_column :teachers, :price, :decimal
  end
end
