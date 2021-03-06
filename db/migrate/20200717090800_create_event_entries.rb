class CreateEventEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :event_entries do |t|
      t.integer :user_id, null: false
      t.integer :event_id, null: false

      t.timestamps
    end
    add_index :event_entries, [:user_id, :event_id], unique: true
  end
end
