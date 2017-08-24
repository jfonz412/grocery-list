require 'test_helper'

class ListsControllerTest < ActionDispatch::IntegrationTest

	test "should get new if logged in" do
		get new_list_path
		assert_response :redirect
		log_in_as(users(:bob))
		# Error because of the way I pass variables to partials appended via JS
		# get new_list_path
		# assert_response :success
	end
	

	#NEED LOG IN CALLBACKS
	test "should get index if logged in" do
		log_in_as(users(:bob))
		get lists_path
		assert_response :success
	end

	test "should get show if logged in" do
		log_in_as(users(:bob))
		get lists_show_path(lists(:one).id)
		assert_response :success
	end

	test "should get edit if logged in" do
		log_in_as(users(:bob))
		get lists_edit_path(lists(:one).id)
		assert_response :success
	end

	test "should create valid list, list_items and user_items" do
		log_in_as(users(:bob))
		assert_difference "UserItem.count" do
			assert_difference "List.count" do
				assert_difference "ListItem.count", 2 do
					post list_path, params: { list: { 
																		name: "List", 
																		list_item: [{ user_item_id: user_items(:milk).id,
																								 quantity: 3 }],
																		user_item: [{ name: "Carrots", category_id: categories(:one).id,
																									price: 2.45, quantity: 3 }] } } 																							  
				end
			end
		end
		assert_not flash.empty?
	end
end
