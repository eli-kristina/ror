class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.integer :cat_id
      t.integer :user_id
      t.integer :value, :limit => 1, :default => 0

      t.timestamps
    end
  end
end