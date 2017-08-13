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
=begin

  test "should get edit if logged in" do
    get lists_edit_url
    assert_response :success
  end
=end
end
