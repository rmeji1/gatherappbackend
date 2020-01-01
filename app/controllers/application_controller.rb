class ApplicationController < ActionController::API
  def fallback_index_html
    render :file => 'public/index.html'
  end
  
  private 
  def token(user_id)
    payload = { user_id: user_id } # I want to add watson token here as well
    JWT.encode(payload, hmac_secret, 'HS256')
  end

  def hmac_secret
    ENV["API_SECRET"]
  end

  def client_has_valid_token?
    !!current_user_id
  end

  def current_user_id
    begin
      token = request.headers["Authorization"]
      decoded_array = JWT.decode(token, hmac_secret, true, {algorithm: "HS256"})
      payload = decoded_array.first
      return payload["user_id"]
    rescue
      return nil
    end
  end

  def require_login
    render json: {error: 'Unauthorized'}, status: :unauthorized if !client_has_valid_token?
  end
end
