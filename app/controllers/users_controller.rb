class UsersController < ApplicationController
  before_action :require_login, except: [:create]
  def create
    user = User.create(user_params)
    if user.valid?
      render json: {token: token(user.id), user_id: user.id}, status: :created #201
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity #422
    end
  end

  private 
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
