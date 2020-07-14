class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :user_id, null: false
      t.integer :tweet_id, null: false
      t.text :content

      t.timestamps
    end
  end
end
