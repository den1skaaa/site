class CreateComents < ActiveRecord::Migration
  def change
    create_table :coments do |t|
      t.integer		:user_id
      t.string		:coment
      t.timestamps
    end
  end
end
