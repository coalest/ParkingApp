class HomeController < ApplicationController
  def login
    @user = current_user
  end
end
