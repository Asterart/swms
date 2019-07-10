class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :content
      t.integer :qty, default: 0

      t.timestamps
    end
  end
end
