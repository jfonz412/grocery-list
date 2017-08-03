class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.float :price
      t.references :user, foreign_key: true
      t.references :list, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
