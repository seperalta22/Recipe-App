class ChangeQuantityDataTypeInInventoryFoods < ActiveRecord::Migration[7.0]
  def change
    change_column :inventory_foods, :quantity, :decimal
  end
end
