require "test_helper"

class UserRatingsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_ratings_create_url
    assert_response :success
  end

  test "should get show" do
    get user_ratings_show_url
    assert_response :success
  end

  test "should get index" do
    get user_ratings_index_url
    assert_response :success
  end
end
