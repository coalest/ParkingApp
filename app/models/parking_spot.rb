class ParkingSpot < ApplicationRecord
  def available?
    Booking.all.empty? || !booked_today? || Booking.last.released?
  end

  def booked_today?
    return false if Booking.all.empty?

    Booking.last.created_at > Time.now.midnight
  end
end
