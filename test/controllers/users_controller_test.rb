require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.new(name: "Foobar", email: "Foo@bar.com",
                     password: "pass123", password_confirmation: "pass123")
  end

  test "should get new" do
    get users_new_url
    assert_response :success
  end

  test "should get show" do
    get users_show_url
    assert_response :success
  end

  test "should have proper title" do
  	get users_new_url
  	assert_select "title", "Sign Up"
  end

  test "signup with valid info" do
    get users_new_path 
    assert_difference "User.count", 1 do
      post users_new_path, params:{ user: { name: "Foobar", email: "Foo@bar.com",
                                            password: "pass123", 
                                            password_confirmation: "pass123" } }
    end
  end

  test "no signup with invalid info" do
    get users_new_path 
    assert_no_difference "User.count" do
      post users_new_path, params:{ user: { name: " ", email: " ",
                                            password: " ", 
                                            password_confirmation: " " } }
    end
  end
end
