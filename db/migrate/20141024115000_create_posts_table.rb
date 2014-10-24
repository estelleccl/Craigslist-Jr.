class CreatePostsTable < ActiveRecord::Migration
  def change 
    create_table :posts do |t|
      t.string :title 
      t.string :description
      t.string :location
      t.integer :postcode      
      t.string :email    
      t.string :phone_number
      t.string :poster_name
      t.integer :compensation
      t.string :img_link
      t.integer :key
      t.string :category_id
      
      t.timestamps
    end
  end
end