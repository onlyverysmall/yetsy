class AddNameOfAttrForFilepickerUrlToItems < ActiveRecord::Migration
  def up
    add_column :items, :filepicker_url, :string
  end

  def down
    remove_column :items, :filepicker_url
  end
end
