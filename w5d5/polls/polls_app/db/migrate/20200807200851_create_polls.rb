class CreatePolls < ActiveRecord::Migration[5.2]
  def change
    create_table :polls do |t|
      t.string :title, null: false, unique: true
      t.integer :user_id, null: false
    end

    add_index :polls, :user_id
  end
end
