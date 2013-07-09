class AddStatusToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :status, :boolean, null: false, default: false
  end
end
