require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_show_url
    assert_response :success
  end

  test "should get edit" do
    get users_edit_url
    assert_response :success
  end

  test "should get index" do
    get users_index_url
    assert_response :success
  end

  test "should get search" do
    get users_search_url
    assert_response :success
  end

  test "should get follows" do
    get users_follows_url
    assert_response :success
  end

  test "should get followers" do
    get users_followers_url
    assert_response :success
  end
end
