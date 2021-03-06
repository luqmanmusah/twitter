class CreateFriendships < ActiveRecord::Migration[6.1]
  def change
    create_table :friendships do |t|
      t.references :follower, null: false, foreign_key: {to_table: :users}
      t.references :followed, null: false, foreign_key: {to_table: :users}
      t.boolean :confirmed

      t.timestamps
    end
  end
end
