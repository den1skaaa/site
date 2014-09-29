class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.boolean :admin
      t.string 	:username
      t.text	:userinfo
      t.binary	:avatar
      t.timestamps
    end
  end
end