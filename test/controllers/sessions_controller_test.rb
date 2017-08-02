require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.new(name: "Foobar", email: "Foo@bar.com",
                     password: "pass123", password_confirmation: "pass123")
    @user.save
  end
  test "should get new" do
    get login_path
    assert_response :success
  end

  test "login/logout with valid info" do
    get login_path
    post sessions_create_path, params: { session: { email: @user.email,
                                                    password: "pass123" } }
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path

    assert is_logged_in?
    delete logout_path
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path,      count: 0
  end

  test "no login with invalid info" do
    get login_path
    post sessions_create_path, params: { session: { email: @user.email,
                                                    password: "wrongpass456" } }
    assert_template 'sessions/new'
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path, count: 0
  end
end
