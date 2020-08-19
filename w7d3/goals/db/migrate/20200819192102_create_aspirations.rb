class CreateAspirations < ActiveRecord::Migration[5.2]
  def change
    create_table :aspirations do |t|
      t.string :body, null: false
      t.integer :user_id, null: false
      t.boolean :completed?, null: false 
      t.boolean :private?, null: false
      t.index :user_id
      t.timestamps
    end
  end
end
