class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :price
      t.integer :quantity, default: 1
      t.boolean :payed, default: false

      t.timestamps
    end
  end
end
