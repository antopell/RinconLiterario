require "test_helper"

class AmigosControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get amigos_view_url
    assert_response :success
  end
end
