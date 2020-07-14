class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :user_id, null: false
      t.string :title
      t.text :content
      t.string :image
      t.timestamps
    end
  end
end
