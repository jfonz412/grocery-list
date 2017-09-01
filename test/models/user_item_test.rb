require 'test_helper'

class UserItemTest < ActiveSupport::TestCase
	def setup
		@item = UserItem.new(name: "Bread", price: 1.25, 
													user_id: users(:bob).id, 
													category_id: categories(:one).id)
	end

	test "should be valid" do
		assert @item.valid?
	end

	test "must have user id" do
		@item.user_id = nil
		assert_not @item.valid?
	end

	test "must have category id" do
		@item.category_id = nil
		assert_not @item.valid?
	end

	test "name can't be blank" do
		@item.name = " "
		assert_not @item.valid?
	end

	test "price CAN be blank" do
		@item.price = nil
		assert @item.valid?
	end

	test "price can't be less than 0" do
		@item.price = -1.05
		assert_not @item.valid?
	end

	test "name can't be longer than 20 chars" do
		@item.name = "a" * 21
		assert_not @item.valid?
	end	

	test "name can't be shorter than 3 chars" do
		@item.name = "aa"
		assert_not @item.valid?
	end	
end
