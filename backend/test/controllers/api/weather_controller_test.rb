require "test_helper"

class Api::WeatherControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_weather_index_url
    assert_response :success
  end
end
