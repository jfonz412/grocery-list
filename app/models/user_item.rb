class UserItem < ApplicationRecord
	# Validations
	validates :name, presence: true, uniqueness: { case_sensitive: false },
			  						 length: { minimum: 3, maximum: 20 }
	# Relationships
  belongs_to :user
  belongs_to :category
  has_many 	 :list_items
  has_many   :lists, :through => :list_items
end
