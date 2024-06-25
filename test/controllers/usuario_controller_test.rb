require "test_helper"

class UsuarioControllerTest < ActionDispatch::IntegrationTest
  test "should get profile" do
    get usuario_profile_url
    assert_response :success
  end
end
