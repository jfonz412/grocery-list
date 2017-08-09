class ChangeColumnNameListItem < ActiveRecord::Migration[5.0]
  def change
  	remove_reference(:list_items, :user_items, index: true, foreign_key: true)
  	add_reference :list_items, :user_item, foreign_key: true
  end
end
