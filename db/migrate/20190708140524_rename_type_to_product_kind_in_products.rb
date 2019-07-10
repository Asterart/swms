class RenameTypeToProductKindInProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :type, :product_kind
  end
end
