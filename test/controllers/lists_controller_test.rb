require 'test_helper'

class ListsControllerTest < ActionDispatch::IntegrationTest

	test "should get new if logged in" do
		get new_list_path
		assert_response :redirect
		log_in_as(users(:bob))
		get new_list_path
		assert_response :success
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

	test "should create valid list and list items" do
		log_in_as(users(:bob))
		assert_difference "List.count", 1 do
		post list_path, params: { list: { 
															name: "List", 
															list_item_attributes: {
															list_item: { user_item_id: user_items(:milk) } } } }
		end
		assert_not flash.empty?
	end
end
