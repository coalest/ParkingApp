require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @spot = parking_spots(:one)
    @user1 = users(:one)
    @user2 = users(:two)
    @booking = bookings(:one)
  end

  def teardown
    Booking.delete_all
  end

  test "book_spot doesn't book unavailable spots" do
    @user1.book_spot
    assert_nil @user2.book_spot
    assert_equal Booking.last_user, @user1
  end

  test "book_spot books spot" do
    Booking.delete_all
    assert @user1.book_spot
    assert_equal Booking.last_user, @user1
  end

  test "release_spot releases spot" do
    assert @user1.release_spot
    assert @booking.reload.released_at
    assert ParkingSpot.available?
  end

  test "other users cant release spot if they didnt book it" do
    @user1.book_spot
    assert_nil @user2.release_spot
    assert_nil @booking.reload.released_at
    refute ParkingSpot.available?
  end
end
