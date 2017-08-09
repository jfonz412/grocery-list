class ListItem < ApplicationRecord
	belongs_to :list
	belongs_to :user_item
end
