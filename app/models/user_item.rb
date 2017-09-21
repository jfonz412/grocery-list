class UserItem < ApplicationRecord
	before_validation :set_nil_price
	
	# So when new item is added it can immediately be added to a list
	attr_accessor :quantity 

	# Validations
	validates :name, presence: true, length: { minimum: 3, maximum: 20 }
	validates :price, numericality: {greater_than_or_equal_to: 0}
	# Relationships
  belongs_to :user
  belongs_to :category
  has_many 	 :list_items, :dependent => :destroy # prevents error
  has_many   :lists, :through => :list_items

  private 
  	def set_nil_price
  		if self.price.nil?
  			self.price = 0.00
  		end
  	end
end
