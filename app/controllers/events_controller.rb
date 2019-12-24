class EventsController < ApplicationController
  before_action :require_login
  def index 
    user = User.find(params.require(:user_id))
    PushService.sendPush(user)

    render json: user.events, status: :ok
  end

  def create 
    begin
      event = Event.create(event_params)
      render json: event, status: :created
    rescue StandardError => e
      render json: {error: "unable to create "}, status: :not_found
    end
  end

  private 
  def event_params
    params.require(:event).permit(:title, :description).merge(params.permit(:user_id))
  end
end
