class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :topic
      t.integer :agree_count
      t.integer :disagree_count
      t.references :user

      t.boolean :is_published

      t.timestamps
    end
  end
end
