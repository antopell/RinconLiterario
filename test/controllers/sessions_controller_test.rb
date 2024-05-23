require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get logIn" do
    get sessions_logIn_url
    assert_response :success
  end
end
