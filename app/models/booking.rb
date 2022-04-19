class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :parking_spot

  def self.last_user
    User.find(Booking.last.user_id)
  end

  def released?
    !!released_at
  end
end
