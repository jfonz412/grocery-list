require 'test_helper'

class ListItemTest < ActiveSupport::TestCase
	def setup
		@item = ListItem.new(list_id: lists(:one).id, user_item_id: user_items(:one).id)
	end

	test "should be valid" do
		assert @item.valid?
	end

	test "must have list id" do
		@item.list_id = nil
		assert_not @item.valid?
	end

	test "must have user_item id" do
		@item.user_item_id = nil
		assert_not @item.valid?
	end
end
