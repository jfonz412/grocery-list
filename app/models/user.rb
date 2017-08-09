class User < ApplicationRecord
	attr_accessor :remember_token

	# Callbacks
	before_save :downcase_email
	after_save  :create_default_categories

	# Validations
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :name,  presence: true, length: { minimum: 3, maximum: 20 }
	validates :email, presence: true, length: { maximum: 255 }, 
			  format: { with: VALID_EMAIL_REGEX },
			  uniqueness: { case_sensitive: false } #emails must be unique no matter the case
	validates :password, length: {minimum:6} # no need to validate presence here
	has_secure_password

	# Relationships
	has_many :lists
	has_many :user_items
	has_many :categories

	#digests a string, increasing security
	#called with class name so it can be called without an instance
	def User.digest(string) 
	    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                              		  BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

	# generates random token using Ruby standard librare (SecureRandom)
	def User.new_token
		SecureRandom.urlsafe_base64
	end

	# get and digest new token, update attribute with token
	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end

	# take user's remember digest and compare it to remember token (arg1)
	def authenticated?(remember_token)
		return false if remember_digest.nil? # stops bug 9.17
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end

	# when user logs out, erase remember token
	def forget
		update_attribute(:remember_digest, nil)
	end

	private
		def downcase_email
			self.email.downcase!
		end

		def create_default_categories
			default_categories = ["Dairy", "Bakery", "Produce", "Deli", "Meat",
								 					  "Frozen", "Pantry Items"]
			default_categories.each do |category|
				new_category = self.categories.build(name: category)
				new_category.save
			end
		end
end

