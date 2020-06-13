require 'test_helper'

class LocalartistsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get localartists_index_url
    assert_response :success
  end

  test "should get show" do
    get localartists_show_url
    assert_response :success
  end

end
