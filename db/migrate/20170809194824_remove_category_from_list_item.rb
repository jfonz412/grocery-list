class RemoveCategoryFromListItem < ActiveRecord::Migration[5.0]
  def change
  	remove_reference(:list_items, :category, index: true)
  end
end
