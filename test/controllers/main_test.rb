require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  setup do
  end

  test "should get index" do
    get root_url
    assert_response :success
  end

end
