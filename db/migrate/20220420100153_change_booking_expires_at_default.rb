class ChangeBookingExpiresAtDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default :bookings, :expires_at, Time.now.at_end_of_day
  end
end
