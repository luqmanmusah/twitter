class AddAuthorIdToOpinion < ActiveRecord::Migration[6.1]
  def change
    add_reference :opinions, :author, foreign_key: { to_table: :users}
  end
end
