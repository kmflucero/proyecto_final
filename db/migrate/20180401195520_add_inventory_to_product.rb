class AddInventoryToProduct < ActiveRecord::Migration[5.1]
  def change
    add_reference :products, :inventory, foreign_key: true
  end
end
