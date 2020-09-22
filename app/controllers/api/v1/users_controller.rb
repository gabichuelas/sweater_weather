class Api::V1::UsersController < ApplicationController

  def create
    new_user = User.new(user_params)
    new_user.api_key = SecureRandom.uuid
    if new_user.save
      render json: UserSerializer.new(new_user), status: 201
    else
      render json: new_user.errors.full_messages, status: 401
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
