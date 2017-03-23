require "test_helper"

class StaticpageControllerTest < ActionDispatch::IntegrationTest
  test "should get ethos page" do
    get ethos_url
    assert_response :success
  end
  test "should get contribute page" do
    get contribute_url
    assert_response :success
  end
end
