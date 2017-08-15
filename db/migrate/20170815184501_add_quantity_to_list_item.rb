class AddQuantityToListItem < ActiveRecord::Migration[5.0]
  def change
  	add_column :list_items, :quantity, :integer, default: 1
  end
end
