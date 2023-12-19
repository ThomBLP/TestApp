require "test_helper"

class VehiclesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get vehicles_index_url
    assert_response :success
  end

  test "should get create" do
    get vehicles_create_url
    assert_response :success
  end

  test "should get delete" do
    get vehicles_delete_url
    assert_response :success
  end
end
