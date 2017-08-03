class List < ApplicationRecord
	# Relationships
  belongs_to :user
  has_many :list_items
end
