class CreateEventComments < ActiveRecord::Migration[6.0]
  def change
    create_table :event_comments do |t|
      t.integer :user_id, null: false
      t.integer :event_id, null: false
      t.string :content

      t.timestamps
    end
  end
end
