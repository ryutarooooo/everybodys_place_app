class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :profile_image
      t.integer :age
      t.string :place
      t.string :hobby
      t.text :using_reason
      t.text :trouble
      t.text :hope
      t.text :content
      t.boolean :flag, default: true

      t.timestamps
    end
  end
end
