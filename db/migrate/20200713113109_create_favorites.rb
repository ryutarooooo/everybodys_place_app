class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.string :user_id, null: false
      t.string :tweet_id, null: false

      t.timestamps
    end
  end
end
