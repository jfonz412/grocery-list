require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

	# Does not seem to be testing remote/JQuery submissions
  test "should create category if logged in" do
  	assert_no_difference "Category.count" do
    	post categories_create_url params: { category: {name: "Category"} }
		end
		log_in_as(users(:bob))
	  	assert_difference "Category.count" do
	    	post categories_create_url params: { category: {name: "Category"} }
		end
		get new_list_path
		assert_select "div:match('id', ?)", "Category"
	end
end
