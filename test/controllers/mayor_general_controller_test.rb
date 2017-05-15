require 'test_helper'

class MayorGeneralControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mayor_general_index_url
    assert_response :success
  end

end
