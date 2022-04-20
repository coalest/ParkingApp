class HomeController < ApplicationController
  def login
    redirect_to bookings_url if user_signed_in?
  end
end
