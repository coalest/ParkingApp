require "test_helper"

class BookingTest < ActiveSupport::TestCase
  def setup
    @spot = parking_spots(:one)
    @user1 = users(:one)
    @booking = bookings(:one)
  end

  def teardown
    Booking.delete_all
    ParkingSpot.delete_all
    User.delete_all
  end

  test "last_user should return correct User" do
    assert_equal Booking.last_user, @user1
  end

  test "last_user should return nil if no bookings" do
    Booking.delete_all
    assert_nil Booking.last_user
  end

  test "release! updates released_at time" do
    assert_nil @booking.released_at
    @booking.release!
    assert @booking.released_at
  end

  test "released? returns true if booking is released" do
    @booking.released_at = Time.now
    assert @booking.released?
  end

  test "released? returns false if booking hasn't been released" do
    refute @booking.released?
  end
end
