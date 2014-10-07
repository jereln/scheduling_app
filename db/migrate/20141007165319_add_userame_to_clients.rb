class AddUserameToClients < ActiveRecord::Migration
  def change
    add_column :clients, :username, :string
    add_column :clients, :first_name, :string
    add_column :clients, :last_name, :string
    remove_column :clients, :name
  end
end
