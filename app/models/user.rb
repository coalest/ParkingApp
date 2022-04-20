class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable

  devise :rememberable, :omniauthable, omniauth_providers: %i[slack]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def book_spot
    return unless ParkingSpot.available?

    Booking.create(user_id: id,
      parking_spot_id: ParkingSpot.first.id)
  end

  def release_spot
    last_booking = Booking.last
    return unless Booking.last_user == self && !last_booking.released?

    last_booking.release!
  end
end
