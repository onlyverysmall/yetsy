class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.integer :owner_id, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
