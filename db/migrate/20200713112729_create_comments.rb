class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :user_id, null: false
      t.integer :comment_id, null: false
      t.text :title
      t.text :content
      t.string :tweet_image

      t.timestamps
    end
  end
end
