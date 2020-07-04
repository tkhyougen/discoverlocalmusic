require 'test_helper'

class SpotcommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get spotcomments_create_url
    assert_response :success
  end

end
