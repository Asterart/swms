class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :phone_number
      t.string :email
      t.string :nip_number
      t.string :company_name
      t.string :address_street
      t.string :address_citycode
      t.string :address_city
      t.string :address_country
      t.text :notes

      t.timestamps
    end
  end
end
