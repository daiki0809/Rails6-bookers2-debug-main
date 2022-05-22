require "test_helper"

class EventMailsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get event_mails_new_url
    assert_response :success
  end
end
