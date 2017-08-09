require 'test_helper'

class ListsControllerTest < ActionDispatch::IntegrationTest

  test "should get new if logged in" do
    get new_list_path
    assert_response :redirect
    log_in_as(users(:bob))
    get new_list_path
    assert_response :success
  end
  
=begin

  #NEED LOG IN CALLBACKS
  test "should get index" do
    get lists_path
    assert_response :success
  end

  test "should get show" do
    get lists_show_url
    assert_response :success
  end

  test "should get edit" do
    get lists_edit_url
    assert_response :success
  end
=end
end
