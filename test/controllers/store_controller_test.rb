require 'test_helper'

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_index_url
    assert_response :success
  end

  test "should get show" do
    get store_show_url
    assert_response :success
  end

  test "should get new" do
    get store_new_url
    assert_response :success
  end

  test "should get edit" do
    get store_edit_url
    assert_response :success
  end

  test "should get delete" do
    get store_delete_url
    assert_response :success
  end

end
