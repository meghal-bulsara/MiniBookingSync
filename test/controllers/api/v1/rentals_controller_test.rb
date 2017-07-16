require 'test_helper'

class Api::V1::RentalsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_rentals_index_url
    assert_response :success
  end

end
