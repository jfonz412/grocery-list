require 'test_helper'

class ListsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_list_path
    assert_response :success
  end

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

end
