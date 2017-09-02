require 'test_helper'

class UserItemsControllerTest < ActionDispatch::IntegrationTest
	test "won't create item if not logged in" do
		assert_no_difference "UserItem.count" do
			post user_items_create_path, params: { user_item: { name: "Tomatoes", price: 1.25,
																												category_id: categories(:one).id } }
		end
		assert_response :redirect
	end

	test "Create item if logged in" do
		log_in_as(users(:bob))
		assert_difference "UserItem.count" do
			post user_items_create_path, params: { user_item: { name: "Tomatoes", price: 1.25,
																												category_id: categories(:one).id } }
		end
		assert_response :success
	end
end
