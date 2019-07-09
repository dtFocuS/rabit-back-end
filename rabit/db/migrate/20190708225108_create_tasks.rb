class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :decription
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip_code
      t.float :prefer_cost
      t.string :completed_by

      t.timestamps
    end
  end
end
