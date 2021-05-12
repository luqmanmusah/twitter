class RemoveTestFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :—no-test-framework, :string
  end
end
