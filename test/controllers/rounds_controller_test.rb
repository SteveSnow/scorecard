require 'test_helper'

class RoundsControllerTest < ActionController::TestCase
  test "should get complete" do
    get :complete
    assert_response :success
  end

  test "should get in_progress" do
    get :in_progress
    assert_response :success
  end

end
