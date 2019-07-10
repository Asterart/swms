class AddDetailsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :delivery, :string
    add_column :orders, :notes, :text
  end
end
