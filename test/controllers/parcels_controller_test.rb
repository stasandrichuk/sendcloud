require 'test_helper'

class ParcelsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get parcels_index_url
    assert_response :success
  end

  test "should get new" do
    get parcels_new_url
    assert_response :success
  end

end
