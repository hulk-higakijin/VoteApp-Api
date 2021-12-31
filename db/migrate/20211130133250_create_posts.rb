class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :topic, null: false
      t.integer :agree_count, default: 0
      t.integer :disagree_count, default: 0
      t.integer :likes_count, default: 0
      t.references :user

      t.boolean :is_published, default: false

      t.timestamps
    end
  end
end
