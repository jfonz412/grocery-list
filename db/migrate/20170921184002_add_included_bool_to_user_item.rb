class AddIncludedBoolToUserItem < ActiveRecord::Migration[5.0]
  def change
  	add_column :user_items, :included, :boolean, default: true
  end
end
