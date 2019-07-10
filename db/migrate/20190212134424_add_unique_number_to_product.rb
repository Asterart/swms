class AddUniqueNumberToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :product_index, :string
  end
end
