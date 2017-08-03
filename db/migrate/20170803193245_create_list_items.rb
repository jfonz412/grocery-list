class CreateListItems < ActiveRecord::Migration[5.0]
  def change
    create_table :list_items do |t|
      t.string :name
      t.float :price
      t.references :list, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
