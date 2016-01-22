class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :reader_id
      t.integer :book_id

      t.timestamps null: false
    end
    add_index :favorites, :book_id
    add_index :favorites, :reader_id
    add_index :favorites, [:book_id, :reader_id], unique: true
  end
end
