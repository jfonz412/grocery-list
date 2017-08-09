class ListItem < ApplicationRecord
	validates :name, presence: true, uniqueness: { case_sensitive: false }
	belongs_to :list
	belongs_to :category
end
