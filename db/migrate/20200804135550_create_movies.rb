class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :url
      t.text :content
      t.string :category

      t.timestamps
    end
  end
end
