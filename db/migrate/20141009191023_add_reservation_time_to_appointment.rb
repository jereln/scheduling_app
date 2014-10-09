class AddReservationTimeToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :reservation_time, :time
  end
end
