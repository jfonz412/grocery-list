class List < ApplicationRecord
	# Validations
  belongs_to :user
  has_many :list_items
end
