class RemoveComfirmedFromFriendship < ActiveRecord::Migration[6.1]
  def change
    remove_column :friendships, :confirmed, :boolean
  end
end
