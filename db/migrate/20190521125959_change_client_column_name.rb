class ChangeClientColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :clients, :name, :client_name
  end
end
