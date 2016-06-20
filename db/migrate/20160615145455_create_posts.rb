class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.integer :user_id, foreign_key: true

      t.timestamps :date
    end
  end
end
