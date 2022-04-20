require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:one)
  end

  test "should get index" do
    sign_in @user
    get root_path
    assert_response :success
  end

  test "should redirect to login if not signed in" do
    get root_path
    assert_response 302
    follow_redirect!
    assert_template "home/login"
  end
end
