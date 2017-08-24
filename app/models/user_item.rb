class UserItem < ApplicationRecord
	# So when new item is added it can immediately be added to a list
	attr_accessor :quantity 

	# Validations
	validates :name, presence: true, uniqueness: { case_sensitive: false },
			  						 length: { minimum: 3, maximum: 20 }
	# Relationships
  belongs_to :user
  belongs_to :category
  has_many 	 :list_items
  has_many   :lists, :through => :list_items
end
