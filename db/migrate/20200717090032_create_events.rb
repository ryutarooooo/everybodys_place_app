class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.integer :user_id, null: false
      t.string :name
      t.string :prefecture
      t.string :place
      t.string :title
      t.string :content
      t.integer :count
      t.integer :price
      t.string :image
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
