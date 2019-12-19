class UsersController < ApplicationController
  before_action :require_login, except: [:create]
  
  def index 
    users = User.where("username LIKE ?", params[:query] << '%')
    render json: users
  end

  def show
    user = User.find(params.require(:id))
    if user
      render json: user, status: :ok
    else
      render json: {error: 'cant find user'}, status: :not_found
    end
  end

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
