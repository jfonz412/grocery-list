class List < ApplicationRecord
	# Relationships
  belongs_to :user
  has_many 	 :list_items
  has_many 	 :items, :through => :list_items, source: :user_item

  #list item creation
  accepts_nested_attributes_for :list_items

	def total
	  total = 0.00
	  self.items.each do |item|
	    list_item = self.list_items.find_by(user_item_id: item.id)
	    total = total + (item.price * list_item.quantity)
	  end
	  total = '%.2f' % total
	end
end
