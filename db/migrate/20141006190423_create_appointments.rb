class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :client_id
      t.integer :therapist_id
      t.date :date
      t.time :start_time
      t.time :end_time
      t.boolean :reserved

      t.timestamps
    end
  end
end
