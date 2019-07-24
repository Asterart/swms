class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :product, foreign_key: true
      t.references :order, foreign_key: true
      t.integer :ordered_product_quantity

      t.timestamps
    end
  end
end
