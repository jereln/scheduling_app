class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|

      t.timestamps
    end
  end
end
