require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end



  test "should get dashboard" do
    get pages_index_url
    assert_response :success
  end
end
