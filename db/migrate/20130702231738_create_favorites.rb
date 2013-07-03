class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :item_id

      t.timestamps
    end

    add_index :favorites, :user_id
    add_index :favorites, :item_id
  end
end
