class Category < ApplicationRecord
	# Validations
	has_many :items
end
