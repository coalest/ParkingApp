class Slack::CommandsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :verify_slack_request

  def create
    json = {text: params[:text] + "d!"}

    render json: json
  end

  private

  def verify_slack_request
    # implementation
  end
end
