require 'test_helper'

class ApiControllerTest < ActionDispatch::IntegrationTest
  test "should get set_action_permission" do
    get api_set_action_permission_url
    assert_response :success
  end

  test "should get set_resource_permission" do
    get api_set_resource_permission_url
    assert_response :success
  end

end
