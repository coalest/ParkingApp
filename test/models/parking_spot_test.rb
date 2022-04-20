require "test_helper"

class ParkingSpotTest < ActiveSupport::TestCase
  def setup
    @spot = parking_spots(:one)
    @user = users(:one)
  end

  def teardown
    Booking.delete_all
  end

  test "spot should be available with no bookings" do
    assert ParkingSpot.available?
  end

  test "spot should be available with old booking" do
    Booking.create(user_id: @user.id, parking_spot_id: @spot.id, created_at: Time.now.prev_day, expires_at: Time.now.prev_day.at_end_of_day)
    assert ParkingSpot.available?
  end

  test "spot should be available with released booking" do
    Booking.create(user_id: @user.id, parking_spot_id: @spot.id, created_at: Time.now.ago(2.hours), released_at: Time.now.ago(1.hour))
    assert ParkingSpot.available?
  end

  test "spot should not be available with active booking" do
    Booking.create!(user_id: @user.id, parking_spot_id: @spot.id, created_at: Time.now.ago(1.hour))
    refute ParkingSpot.available?
  end
end
