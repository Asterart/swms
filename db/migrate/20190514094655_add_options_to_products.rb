class AddOptionsToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :buy_number, :string
    add_column :products, :length, :float
    add_column :products, :gramature, :string
    add_column :products, :structure, :string
    add_column :products, :color, :string
  end
end
