class CreateJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :inventories, :products do |t|
      # t.index [:inventory_id, :product_id]
      # t.index [:product_id, :inventory_id]
    end
  end
end
