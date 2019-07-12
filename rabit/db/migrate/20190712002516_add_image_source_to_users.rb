class AddImageSourceToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :img_src, :string
  end
end
