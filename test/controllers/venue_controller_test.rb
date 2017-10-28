require 'test_helper'

class VenueControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get venue_index_url
    assert_response :success
  end

  test "should get new" do
    get venue_new_url
    assert_response :success
  end

  test "should get create" do
    get venue_create_url
    assert_response :success
  end

  test "should get listing" do
    get venue_listing_url
    assert_response :success
  end

  test "should get pricing" do
    get venue_pricing_url
    assert_response :success
  end

  test "should get description" do
    get venue_description_url
    assert_response :success
  end

  test "should get photo_upload" do
    get venue_photo_upload_url
    assert_response :success
  end

  test "should get amenities" do
    get venue_amenities_url
    assert_response :success
  end

  test "should get location" do
    get venue_location_url
    assert_response :success
  end

  test "should get update" do
    get venue_update_url
    assert_response :success
  end

end
