class AddDefaultToItemsPurchased < ActiveRecord::Migration
  def up
    change_column :items, :purchased, :boolean, default: 0
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Can't remove the default"
  end
end
