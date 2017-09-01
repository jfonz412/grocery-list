class ListItem < ApplicationRecord
	before_validation :set_blank_qnty_to_one
	#Validations
	validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 1 }
	# Relationships
	belongs_to :list
	belongs_to :user_item

	private
		def set_blank_qnty_to_one
			if self.quantity == 0
				self.quantity = 1
			end
		end
end
