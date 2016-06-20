class CreatePostCategories < ActiveRecord::Migration
 def change
    create_table :post_categories do |t|
      t.integer :post_id, foreign_key: true
      t.integer :category_id, foreign_key: true
      t.timestamps null: false
    end
  end
end
