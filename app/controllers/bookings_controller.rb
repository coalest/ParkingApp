class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]

  # GET /bookings or /bookings.json
  def index
    redirect_to login_url unless user_signed_in?

    @spot = ParkingSpot.first
    @spot_owner = Booking.last_user
    @user = current_user
    @bookings = Booking.all
  end

  def book
    current_user&.book_spot
    redirect_back_or_to root_path, notice: (I18n.t "book.success")
  end

  def release
    current_user&.release_spot
    redirect_back_or_to root_path, notice: (I18n.t "release.success")
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def booking_params
    params.require(:booking).permit(:user_id, :parking_spot_id, :expires_at, :released_at)
  end
end
