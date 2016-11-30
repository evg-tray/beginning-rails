require 'test_helper'

class RailwaysStationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @railways_station = railways_stations(:one)
  end

  test "should get index" do
    get railways_stations_url
    assert_response :success
  end

  test "should get new" do
    get new_railways_station_url
    assert_response :success
  end

  test "should create railways_station" do
    assert_difference('RailwaysStation.count') do
      post railways_stations_url, params: { railways_station: { title: @railways_station.title } }
    end

    assert_redirected_to railways_station_url(RailwaysStation.last)
  end

  test "should show railways_station" do
    get railways_station_url(@railways_station)
    assert_response :success
  end

  test "should get edit" do
    get edit_railways_station_url(@railways_station)
    assert_response :success
  end

  test "should update railways_station" do
    patch railways_station_url(@railways_station), params: { railways_station: { title: @railways_station.title } }
    assert_redirected_to railways_station_url(@railways_station)
  end

  test "should destroy railways_station" do
    assert_difference('RailwaysStation.count', -1) do
      delete railways_station_url(@railways_station)
    end

    assert_redirected_to railways_stations_url
  end
end
