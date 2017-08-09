class AddUserItemToListItem < ActiveRecord::Migration[5.0]
  def change
    add_reference :list_items, :user_items, foreign_key: true
  end
end
