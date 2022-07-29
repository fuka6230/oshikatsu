require "test_helper"

class TagMemosControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get tag_memos_new_url
    assert_response :success
  end

  test "should get index" do
    get tag_memos_index_url
    assert_response :success
  end

  test "should get create" do
    get tag_memos_create_url
    assert_response :success
  end

  test "should get destroy" do
    get tag_memos_destroy_url
    assert_response :success
  end
end
