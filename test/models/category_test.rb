require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
	def setup
		@category = Category.new(name:"Produce")
	end

	test "should be valid" do
		assert @category.valid?
	end

	test "name can't be blank" do
		@category.name = " "
		assert_not @category.valid?
	end

	test "no duplicate categories" do
		@category.save
		dup_category = @category.dup
		dup_category.name = "PRODUCE"
		assert_not dup_category.valid?
	end
end
