class ListItem < ApplicationRecord
	#Validations
	validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 1 }
	# Relationships
	belongs_to :list
	belongs_to :user_item
end
