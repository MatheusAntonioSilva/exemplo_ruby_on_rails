require 'test_helper'

class HelloControllerTest < ActionController::TestCase
  test "should get word" do
    get :word
    assert_response :success
  end

end
