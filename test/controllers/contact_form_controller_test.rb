require "test_helper"

class ContactFormControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get contact_form_index_url
    assert_response :success
  end
end
