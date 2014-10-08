class SetUserDefault < ActiveRecord::Migration
  def up
    change_column :users, :role, :string, default: 'client'
  end
end
