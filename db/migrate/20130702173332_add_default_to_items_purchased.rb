class AddDefaultToItemsPurchased < ActiveRecord::Migration
  def up
    change_column :items, :purchased, :boolean, default: false
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Can't remove the default"
  end
end
