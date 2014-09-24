class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :email
      t.string :password
      t.string :password_conformation
      t.string :remember_me
      t.timestamps
    end
      add_index :users, :login
      add_index :users, :email, unique: true
  end
end