require "test_helper"

class TagBuilderControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get tag_makers_new_url
    assert_response :success
  end

  test "should get create" do
    get tag_makers_create_url
    assert_response :success
  end
end
