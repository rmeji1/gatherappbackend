class EventsController < ApplicationController
  before_action :require_login
  def index 
    user = User.find(params.require(:user_id))
    render json: user.events, status: :ok
  end

  def create 
    begin
      
      event = Event.create(event_params)
      PushService.sendPush(User.find(params[:user_id]), JSON.generate({"type": "ADD_EVENT", "event": EventSerializer.new(event).as_json}))
      render json: event, status: :created
    rescue StandardError => e
      render json: {error: e}, status: :not_found
    end
  end

  private 
  def event_params
    params.require(:event).permit(:title, :description).merge(params.permit(:user_id))
  end
end
