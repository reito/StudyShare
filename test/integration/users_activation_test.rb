require 'test_helper'

class UsersActivationTest < ActionDispatch::IntegrationTest

  def setup
    @activated_user = users(:michael)
    @non_activated = users(:non_activated)
  end

  test "Only activated user index should be seen" do
    log_in_as(@activated_user)
    get users_path
    assert_select "a[href=?]", user_path(@activated_user)
    assert_select "a[href=?]", user_path(@non_activated), count: 0
  end

  test "Only activated user show should be seen" do
    log_in_as(@activated_user)
    get user_path(@activated_user)
    get user_path(@non_activated)
    assert_redirected_to root_url
  end

end
