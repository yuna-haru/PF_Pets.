require "test_helper"

class Admin::PostImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_post_images_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_post_images_edit_url
    assert_response :success
  end
end
