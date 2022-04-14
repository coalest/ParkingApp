class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :parking_spot, null: false, foreign_key: true
      t.timestamp :booked_at
      t.timestamp :expires_at
      t.timestamp :released_at

      t.timestamps
    end
  end
end
