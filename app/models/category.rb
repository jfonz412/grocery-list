class Category < ApplicationRecord
	# Validations
	has_many :user_items
	has_many :list_items
end
