require 'test_helper'

class KanbansControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get kanbans_new_url
    assert_response :success
  end

end
