class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to bookings_url
    else
      redirect_to login_url
    end
  end

  def login
    @user = current_user
  end
end
