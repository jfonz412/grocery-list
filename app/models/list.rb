class List < ApplicationRecord
	# Relationships
  belongs_to :user
  has_many 	 :list_items
  has_many 	 :items, :through => :list_items, source: :user_item

  #list item creation
  accepts_nested_attributes_for :list_items
end
