class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :parking_spot
  scope :for_today, -> { where("created_at >= ? AND created_at < ?", Date.today, Date.tomorrow) }
  scope :not_released, -> { where(released_at: nil) }

  def self.last_user
    User.find(Booking.last.user_id) unless Booking.count == 0
  end

  def release!
    touch(:released_at)
  end

  def released?
    !!released_at
  end
end
