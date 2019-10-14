class ChangeDefaultLocationToAddressInUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :default_location, :address
  end
end
