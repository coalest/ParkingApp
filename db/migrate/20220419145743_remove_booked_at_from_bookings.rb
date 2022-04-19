class RemoveBookedAtFromBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :booked_at, :timestamp
  end
end
