require 'test_helper'

class AssistantControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get assistant_create_url
    assert_response :success
  end

end
