class AddCancelledIdToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :cancelled_id, :integer
  end
end
