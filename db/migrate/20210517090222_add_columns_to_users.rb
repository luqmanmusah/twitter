class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string
    add_column :users, :fullname, :string
    add_column :users, :photo, :string
    add_column :users, :coverimage, :string
    add_index :users, :username, unique: true
  end
end
