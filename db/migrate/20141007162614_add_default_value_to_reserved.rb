class AddDefaultValueToReserved < ActiveRecord::Migration
  def up
    change_column :appointments, :reserved, :boolean, default: false
  end
end
