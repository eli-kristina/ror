class CreateFavourites < ActiveRecord::Migration[6.0]
  def change
    create_table :favourites do |t|
      t.integer :cat_id
      t.integer :user_id

      t.timestamps
    end
  end
end