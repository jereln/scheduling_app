class CreateTherapists < ActiveRecord::Migration
  def change
    create_table :therapists do |t|
      t.timestamps
    end
  end
end
