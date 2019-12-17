class LoginController < ApplicationController
  def create
    user = User.find_by("lower(username) = ?", user_params[:username].downcase)
    if user && user.authenticate(user_params[:password])
      render json: { token: token(user.id), user_id: user.id }, status: :created #201
    else 
      render json: { errors: user.errors.messages }, status: :unprocessable_entity #422
    end 
  end


  private 
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
