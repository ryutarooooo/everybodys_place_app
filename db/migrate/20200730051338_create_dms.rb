class CreateDms < ActiveRecord::Migration[6.0]
  def change
    create_table :dms do |t|
      t.integer :send_user_id
      t.integer :receive_user_id
      t.text :content

      t.timestamps
    end
    add_index :dms, :send_user_id
    add_index :dms, :receive_user_id
  end
end
