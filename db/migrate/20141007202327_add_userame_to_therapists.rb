class AddUserameToTherapists < ActiveRecord::Migration
  def change
    add_column :therapists, :username, :string
    add_column :therapists, :first_name, :string
    add_column :therapists, :last_name, :string
  end
end
