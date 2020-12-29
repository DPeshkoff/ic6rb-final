require 'test_helper'

class TimetablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:admin)
  end

  test "should create timetable" do
    get login_url
    post "/auth", params: {
      username: @user.username,
      password: @user.password

    }
    get add_url
    post "/new", params: {
        group: "test1212"

    }
    assert_response :redirect
  end

end
