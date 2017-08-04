require 'test_helper'

class UserItemTest < ActiveSupport::TestCase
	def setup
		@item = UserItem.new(name: "Milk", price: 1.25, 
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

	test "no duplicate items" do
		@item.save
		dup_item = @item.dup
		dup_item.name = "MILK"
		assert_not dup_item.valid?
	end

	test "price CAN be blank" do
		@item.price = nil
		assert @item.valid?
	end
end