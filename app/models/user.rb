class User < ApplicationRecord
	# Callbacks
	before_save :downcase_email

	# Validations
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :name,  presence: true, length: { minimum: 3, maximum: 20 }
	validates :email, presence: true, length: { maximum: 255 }, 
			  format: { with: VALID_EMAIL_REGEX },
			  uniqueness: { case_sensitive: false } #emails must be unique no matter the case
	validates :password, length: {minimum:6} # no need to validate presence here
	has_secure_password
	private
		def downcase_email
			self.email.downcase!
		end
end

