require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should create category if logged in" do
  	assert_no_difference "Category.count" do
    	post categories_create_url params: { category: {name: "Category"} }
	end
	log_in_as(users(:bob))
  	assert_difference "Category.count" do
    	post categories_create_url params: { category: {name: "Category"} }
	end
	assert_template 'new'
  end
end
