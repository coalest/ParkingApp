class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :rememberable, :omniauthable, omniauth_providers: %i[slack]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name

      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def book_spot
    parking_spot = ParkingSpot.first
    return unless parking_spot.available?

    Booking.create(user_id: id,
      parking_spot_id: ParkingSpot.first.id,
      expires_at: Time.now.at_end_of_day)
  end

  def release_spot
    return unless Booking.last_user == self && !Booking.last.released?

    Booking.last.update(released_at: Time.now)
  end
end
