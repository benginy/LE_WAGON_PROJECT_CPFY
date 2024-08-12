require "test_helper"

class LifeMomentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get life_moments_index_url
    assert_response :success
  end

  test "should get show" do
    get life_moments_show_url
    assert_response :success
  end

  test "should get new" do
    get life_moments_new_url
    assert_response :success
  end

  test "should get create" do
    get life_moments_create_url
    assert_response :success
  end
end
