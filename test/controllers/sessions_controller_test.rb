require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:bob)
    @user.save
  end
  test "should get new" do
    get login_path
    assert_response :success
  end

  test "login/logout with valid info" do
    get login_path
    post login_path, params: { session: { email: @user.email,
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

    # Simulate clicking logout on a second window
    delete logout_path
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path, count: 0
  end

  test "no login with invalid info" do
    get login_path
    post login_path, params: { session: { email: @user.email,
                                                    password: "wrongpass456" } }
    assert_template 'sessions/new'
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path, count: 0
  end

  test "login with remembering" do
    log_in_as(@user, remember_me: '1')
    assert_not_empty cookies['remember_token']
  end

  test "login without remembering" do
    log_in_as(@user, remember_me: '1')
    assert_not_empty cookies['remember_token']
    log_in_as(@user, remember_me: '0')
    assert_empty cookies['remember_token']
  end
end
