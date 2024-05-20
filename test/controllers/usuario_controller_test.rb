require "test_helper"

class UsuarioControllerTest < ActionDispatch::IntegrationTest
  test "should get logIn" do
    get usuario_logIn_url
    assert_response :success
  end

  test "should get sigIn" do
    get usuario_sigIn_url
    assert_response :success
  end
end
