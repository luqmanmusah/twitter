class CreateOpinions < ActiveRecord::Migration[6.1]
  def change
    create_table :opinions do |t|
      t.text :Text

      t.timestamps
    end
  end
end
