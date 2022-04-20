require "test_helper"

class BookingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking = bookings(:one)
    @user = users(:one)
  end

  test "should redirect to login if not signed in" do
    get bookings_url
    assert_response 302
    follow_redirect!
    assert_template "home/login"
  end
end
