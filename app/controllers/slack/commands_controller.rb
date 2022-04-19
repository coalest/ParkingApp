class Slack::CommandsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :verify_slack_request

  def create
    message = case params[:text].downcase
    when "book" then book
    when "release" then release
    when "thief" then parking_spot_owner
    else
      I18n.t "slack.invalid_command"
    end

    render json: {text: message}
  end

  private

  def verify_slack_request
    # make sure request is coming from Slack
  end

  def book
    if current_user.book_spot
      I18n.t "slack.book.success"
    else
      I18n.t "slack.book.failure"
    end
  end

  def release
    if current_user.release_spot
      I18n.t "slack.release.success"
    else
      I18n.t "slack.release.failure"
    end
  end

  def parking_spot_owner
    parking_spot = ParkingSpot.first

    if parking_spot.available?
      I18n.t "slack.thief.none"
    elsif Booking.last_user == current_user
      I18n.t "slack.thief.you"
    else
      I18n.t "slack.thief.someone", user: Booking.last_user.name
    end
  end

  def current_user
    uid = params[:user_id] + "-" + params[:team_id]
    user = User.find_by(uid: uid)
    return user unless user.nil?

    User.create(name: params[:user_name], uid: uid, provider: "slack")
  end
end