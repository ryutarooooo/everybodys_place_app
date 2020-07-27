class CreateChildren < ActiveRecord::Migration[6.0]
  def change
    create_table :children do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :position, null: false
      t.string :name
      t.integer :age
      t.integer :academic_year
      t.string :gender
      t.string :truancy_reason
      t.text :current_status

      t.timestamps
    end
    add_index :children, [:user_id, :position], unique: true
  end
end
