class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :post_id, foreign_key: true
      t.integer :user_id, foreign_key: true

      t.timestamps :date
    end
  end
end
