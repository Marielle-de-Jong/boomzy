require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get references:chatroom" do
    get messages_references:chatroom_url
    assert_response :success
  end

end
