class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string			:title
      t.string 			:hedline
      t.text  			:content
      t.string 			:description
      t.integer			:views
      t.timestamps
    end
  end
end
