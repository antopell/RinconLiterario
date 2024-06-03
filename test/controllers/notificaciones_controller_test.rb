require "test_helper"

class NotificacionesControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get notificaciones_view_url
    assert_response :success
  end
end
