class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :buyer_id, null: false
      t.integer :shop_id, null: false
      t.timestamps
    end
  end
end
