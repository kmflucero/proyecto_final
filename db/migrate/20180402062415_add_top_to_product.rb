class AddTopToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :top, :boolean
  end
end
