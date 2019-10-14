class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :username
      t.float :star_rating
      t.string :default_location

      t.timestamps
    end
  end
end
