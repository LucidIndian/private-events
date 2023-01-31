require "test_helper"

class RsvpsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rsvps_index_url
    assert_response :success
  end

  test "should get accept" do
    get rsvps_accept_url
    assert_response :success
  end

  test "should get refuse" do
    get rsvps_refuse_url
    assert_response :success
  end
end
