class AddDetailsToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :price_net_buy, :float
    add_column :products, :price_net_sell, :float
    add_column :products, :currency, :integer, default: 0
    add_column :products, :length, :float
    add_column :products, :weight, :float
    add_column :products, :color, :integer
    add_column :products, :number_from_shop, :string
    add_column :products, :number_from_purchase, :string
    add_column :products, :shading, :integer
    add_column :products, :quality, :integer
    add_column :products, :structure, :integer
  end
end
