require 'test_helper'

class MysiteControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get mysite_home_url
    assert_response :success
  end

  test "should get post_new" do
    get mysite_post_new_url
    assert_response :success
  end

  test "should get post_detail" do
    get mysite_post_detail_url
    assert_response :success
  end

  test "should get post_edit" do
    get mysite_post_edit_url
    assert_response :success
  end

end
