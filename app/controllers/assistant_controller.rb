require "json"
require "ibm_watson/authenticators"
require "ibm_watson/assistant_v2"

class AssistantController < ApplicationController
  def create
    authenticator = IBMWatson::Authenticators::IamAuthenticator.new(
      apikey: ENV["iam_api_key"]
    )
    service = IBMWatson::AssistantV2.new(
      authenticator: authenticator,
      version: "2018-09-17"
    )
    service.service_url = ENV["service_url"]
    begin
      response = service.message(
        assistant_id: ENV["assistant_id"],
        session_id: params[:session_id],
        input: {
          "text" => params[:message],
          "options" => {
            return_context: true
          }        
        }
      )
      render json: {message: response.result}
    rescue IBMCloudSdkCore::ApiException => e
      if (e.error == 'Invalid Session') 
        render json: {need_new_session: true, message: "Create new session"}, status: :not_acceptable
      else
        render json: { message: "unknown error"}
      end
    end
      
  end

  def create_session
    authenticator = IBMWatson::Authenticators::IamAuthenticator.new(
      apikey: ENV["iam_api_key"]
    )
    service = IBMWatson::AssistantV2.new(
      authenticator: authenticator,
      version: "2018-09-17"
    )
    service.service_url = ENV["service_url"]
    response = service.create_session(
      assistant_id: ENV["assistant_id"]
    )
    session_id = response.result["session_id"]
    render json: {session_id: session_id}
  end
end
