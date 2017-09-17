require 'test_helper'

class ListsControllerTest < ActionDispatch::IntegrationTest

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

	test "must be logged in to create list" do 
		assert_no_difference "List.count" do
			assert_no_difference "ListItem.count" do
				post list_path, params: { list: { 
																	name: "List", 
																	list_item: [{ user_item_id: user_items(:milk).id,
																							 	quantity: 3 },
																						  { user_item_id: user_items(:cheese).id,
																						 		quantity: 2 }] } }																					  
			end
		end
		assert_response :redirect
	end

	test "should create valid list and list items" do
		log_in_as(users(:bob))
		assert_difference "List.count" do
			assert_difference "ListItem.count", 2 do
				post list_path, params: { list: { 
																	name: "List", 
																	list_item: [{ user_item_id: 'nil', # testing for params bug
																							 	quantity: 100 },
																							{ user_item_id: user_items(:yogurt).id,
																							 	quantity: 3 },
																						  { user_item_id: user_items(:cheese).id,
																						 		quantity: 2 }] } }																					  
			end
		end
		assert_not flash.empty?
		# Means that controller is working fine
		# Points to user_item JS creation or HTML as the culprit
		assert ListItem.first.quantity == 3
		assert ListItem.second.quantity == 2
	end
end
