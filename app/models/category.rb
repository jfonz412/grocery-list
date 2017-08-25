class Category < ApplicationRecord
	# Validations
	validates :name, presence: true, length: { maximum: 25 }
	# Relationships
	belongs_to :user
	has_many :user_items
	has_many :list_items
end
