class CreateFollowers < ActiveRecord::Migration[6.0]
  def change
    create_table :followers do |t|
      t.integer :followers_id, null: false
      t.integer :followed_id, null: false

      t.timestamps
    end
  end
end
