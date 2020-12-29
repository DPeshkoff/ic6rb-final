require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:admin)
  end

  test "should get login" do
    get login_url
    assert_response :success
  end

  test "should get register" do
    get register_url
    assert_response :success
  end

  test "should create new user" do
    get register_url
    post "/create", params: {
        username: "abbb",
        password: "a",
        group: "a",
        confirm_password: "a"

    }
    assert_response :redirect
  end

  test "should login" do
    get login_url
    post "/auth", params: {
        username: @user.username,
        password: @user.password

    }
    assert_response :success
  end

end
