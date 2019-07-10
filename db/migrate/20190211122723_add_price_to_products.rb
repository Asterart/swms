class AddPriceToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :price_net_buy, :float
    add_column :products, :price_net_sell, :float
  end
end
