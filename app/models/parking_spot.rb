class ParkingSpot < ApplicationRecord
  def self.available?
    Booking.for_today.not_released.empty?
  end
end
