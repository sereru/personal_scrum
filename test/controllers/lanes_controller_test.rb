require 'test_helper'

class LanesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get lanes_new_url
    assert_response :success
  end

end
