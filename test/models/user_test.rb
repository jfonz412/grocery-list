require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup 
		@user = User.new(name: "Foo", email: "Foo@bar.com",
						password: "foobar", password_confirmation: "foobar")
	end

	test "should be valid" do
		assert @user.valid?
	end

	test "name can't be blank" do
		@user.name = " "
		assert_not @user.valid?
	end

	test "name can't be less than 3 or more than 20 chars" do
		@user.name = "a" * 21
		assert_not @user.valid?
		@user.name = "ab"
		assert_not @user.valid?
	end

	test "email can't be blank" do
		@user.email = " "
		assert_not @user.valid?
	end

	test "email can't be more than 255 chars" do
		@user.email = "a" * 265
		assert_not @user.valid?
	end

	test "valid email" do
		valid_addresses = %w[foo@foobar.com 
							 FOO@bar.COM 
							 F_OO-BR@foo.bar.org
							 foo.bar@foo.jp 
							 foo+bar@bar.cn]
		valid_addresses.each do |valid_address|
			@user.email = valid_address
			# second argument to asset includes custom error message + email that causes it to fail
			assert @user.valid?, "#{valid_address.inspect} should be valid"
		end
	end

	test "reject invalid email" do
		invalid_addresses = %w[user@example,com 
							   user_at_foo.org user.name@example.
			           		   foo@bar_baz.com 
			           		   foo@bar+baz.com 
			           		   twodots@twodots..com]
		invalid_addresses.each do |invalid_address|
			@user.email = invalid_address
			assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
		end
  end

  test "email must be unique" do
  	duplicate_user = @user.dup
  	duplicate_user.email = @user.email.upcase
  	@user.save
  	assert_not duplicate_user.valid?
  end

  test "email should be saved as lower-case" do
  	mixed_case_email = "Foo@ExAMPle.CoM"
  	@user.email = mixed_case_email
  	@user.save
  	assert_equal(mixed_case_email.downcase, @user.reload.email)
  end

  test "password can't be blank" do
  	@user.password = @user.password_confirmation = "    " # multiple assignment
  	assert_not @user.valid?
  end

  test "password should be more than 6 chars" do
  	@user.password = @user.password_confirmation = "a" * 5
  	assert_not @user.valid?
  end

end
