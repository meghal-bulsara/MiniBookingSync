require 'test_helper'

class Api::V1::BookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_bookings_index_url
    assert_response :success
  end

end
