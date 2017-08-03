require 'test_helper'

class ListTest < ActiveSupport::TestCase
	def setup
		@list = List.new(name: "List", user_id: users(:bob).id)
	end

	test "should be valid" do
		assert @list.valid?
	end

	test "must belong to a user" do
		@list.user_id = nil
		assert_not @list.valid?
	end
end
