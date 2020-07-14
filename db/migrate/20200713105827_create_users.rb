class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :profile_image
      t.integer :age
      t.string :place
      t.text :content
      t.string :career
      t.text :using_reason
      t.string :insta_id

      t.timestamps
    end
  end
end
