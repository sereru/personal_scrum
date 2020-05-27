require 'test_helper'

class HomepagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get homepages_home_url
    assert_response :success
  end

  test "should get new" do
    get homepages_new_url
    assert_response :success
  end

  test "should get finish" do
    get homepages_finish_url
    assert_response :success
  end

end
