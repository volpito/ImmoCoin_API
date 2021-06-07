require "test_helper"

class AccommodationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @accommodation = accommodations(:one)
  end

  test "should get index" do
    get accommodations_url, as: :json
    assert_response :success
  end

  test "should create accommodation" do
    assert_difference('Accommodation.count') do
      post accommodations_url, params: { accommodation: { description: @accommodation.description, price: @accommodation.price, title: @accommodation.title } }, as: :json
    end

    assert_response 201
  end

  test "should show accommodation" do
    get accommodation_url(@accommodation), as: :json
    assert_response :success
  end

  test "should update accommodation" do
    patch accommodation_url(@accommodation), params: { accommodation: { description: @accommodation.description, price: @accommodation.price, title: @accommodation.title } }, as: :json
    assert_response 200
  end

  test "should destroy accommodation" do
    assert_difference('Accommodation.count', -1) do
      delete accommodation_url(@accommodation), as: :json
    end

    assert_response 204
  end
end
