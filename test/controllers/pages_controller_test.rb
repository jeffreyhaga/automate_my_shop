require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get how_it_works" do
    get pages_how_it_works_url
    assert_response :success
  end
end
