class Category < ApplicationRecord
	# Validations
	validates :name, presence: true, uniqueness: { case_sensitive: false }

	# Relationships
	has_many :user_items
	has_many :list_items
end
