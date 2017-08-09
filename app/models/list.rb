class List < ApplicationRecord
	# Relationships
  belongs_to :user
  has_many 	 :list_items
  has_many 	 :items, :through => :list_items, source: :user_item
end
