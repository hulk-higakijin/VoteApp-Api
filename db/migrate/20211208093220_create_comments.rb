class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.text :body, null: false
      t.integer :likes_count, default: 0
      t.boolean :is_agree, null: false

      t.timestamps
    end
  end
end
