class AddProductTypeToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :type, :integer
  end
end
