class CreateCats < ActiveRecord::Migration[6.0]
  def change
    create_table :cats do |t|
      t.string :name
      t.string :life_span
      t.string :origin
      t.text :temperament
      t.string :image
      t.integer :hairless, :limit => 1, :default => 0
      t.integer :short_legs, :limit => 1, :default => 0
      t.integer :suppressed_tail, :limit => 1, :default => 0

      t.timestamps
    end
  end
end