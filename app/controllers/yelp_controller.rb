require 'rest-client'

class YelpController < ApplicationController
  before_action :require_login
  def index
    auth = {Authorization: "Bearer #{ENV['API_KEY']}"}
    response = RestClient::Request.execute(method: :get, url:"https://api.yelp.com/v3/businesses/search", 
                                            headers: { 
                                              Authorization: "Bearer #{ENV['API_KEY']}", 
                                              params: {
                                                location: yelp_params[:location], 
                                                limit: yelp_params[:limit],
                                                categories: yelp_params[:categories],
                                                offset: yelp_params[:offset]
                                              }
                                            })
    
    locations = JSON.parse(response.body)
    render json: {businesses: locations["businesses"], total: locations["total"]}, status: :ok
  end

  private
  def yelp_params
    params.permit(:offset, :limit, :categories, :location)
  end
end
