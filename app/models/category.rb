class Category < ApplicationRecord
	# Validations
	validates :name, presence: true, uniqueness: { case_sensitive: false }

	# Relationships
	belongs_to :user
	has_many :user_items
	has_many :list_items
end
