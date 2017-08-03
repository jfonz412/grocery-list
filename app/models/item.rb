class Item < ApplicationRecord
	# Validations
  belongs_to :user
  belongs_to :list
  belongs_to :category
end
