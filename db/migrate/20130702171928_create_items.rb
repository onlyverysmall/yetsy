class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.decimal :price, null: false
      t.integer :category_id, null: false
      t.integer :shop_id, null: false
      t.boolean :purchased, null: false

      t.timestamps
    end

    add_index :items, :shop_id
    add_index :items, :category_id
  end
end
