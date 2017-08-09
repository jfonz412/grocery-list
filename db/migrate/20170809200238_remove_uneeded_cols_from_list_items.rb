class RemoveUneededColsFromListItems < ActiveRecord::Migration[5.0]
  def change
  	remove_column :list_items, :price
  	remove_column :list_items, :name
  end
end
