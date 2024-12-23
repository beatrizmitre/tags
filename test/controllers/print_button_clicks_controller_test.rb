require "test_helper"

class PrintButtonClicksControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get print_button_clicks_create_url
    assert_response :success
  end
end
