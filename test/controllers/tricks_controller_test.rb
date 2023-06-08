require "test_helper"

class TricksControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get tricks_create_url
    assert_response :success
  end

  test "should get show" do
    get tricks_show_url
    assert_response :success
  end

  test "should get index" do
    get tricks_index_url
    assert_response :success
  end
end
