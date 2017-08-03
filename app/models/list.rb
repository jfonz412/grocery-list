class List < ApplicationRecord
	# Validations
  belongs_to :user
  has_many :items
end
