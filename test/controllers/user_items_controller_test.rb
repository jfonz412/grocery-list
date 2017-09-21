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

	test "Won't update included status if not logged in" do
		assert user_items(:milk).included?
		patch user_items_path, params: { user_item_id: user_items(:milk).id }
		assert_response :redirect
		# must go through db, tests re-read default fixture
		assert UserItem.find(user_items(:milk).id).included?
	end

	test "Update 'included' status when logged in" do
		log_in_as(users(:bob))
		patch user_items_path, params: { user_item_id: user_items(:milk).id }
		assert_not UserItem.find(user_items(:milk).id).included?
	end
end
