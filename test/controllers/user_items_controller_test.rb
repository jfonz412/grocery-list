require 'test_helper'

class UserItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_items_create_url
    assert_response :success
  end

  test "should get destroy" do
    get user_items_destroy_url
    assert_response :success
  end

  test "should get update" do
    get user_items_update_url
    assert_response :success
  end

end
