class ChangeProvisionalDefaultToTrue < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:slots, :provisional, :true)
  end
end
