class EventsListsController < ApplicationController
  before_action :require_login
  def create
    begin
      render json: EventsList.create!(add_event_params)
    rescue ActiveRecord::RecordInvalid => e
      render json: {invalid: e.message}
    end
  end
  private 
  def add_event_params
    params
      .require(:event).permit(:yelp_id, :name, :address, :start_time, :end_time)
      .merge(params.permit(:event_id))
  end
end
