class CreateBids < ActiveRecord::Migration[5.2]
  def change
    create_table :bids do |t|
      t.string :amount
      t.string :eta
      t.integer :user_id
      t.integer :task_id

      t.timestamps
    end
  end
end
