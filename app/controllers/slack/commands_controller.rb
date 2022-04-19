class Slack::CommandsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :verify_slack_request

  def create
    text = case params[:text].downcase
    when "book" then book
    when "release" then release
    else
      "Invalid command. Try 'book' or 'release'"
    end

    json = {text: text}

    render json: json
  end

  private

  def verify_slack_request
    # implementation
  end

  def book
    if current_user.book_spot
      "You booked the spot"
    else
      "The spot is already booked"
    end
  end

  def release
    if current_user.release_spot
      "You released the spot"
    else
      "Nothing to release, you don't have the spot booked right now"
    end
  end

  def current_user
    uid = params[:user_id] + "-" + params[:team_id]
    User.find_by(uid: uid)
  end
end
