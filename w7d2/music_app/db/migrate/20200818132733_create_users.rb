class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null:false
      t.string :password_digest, null:false
      t.string :session_token
      t.index :email, unique:true
      t.timestamps
    end
  end
end
