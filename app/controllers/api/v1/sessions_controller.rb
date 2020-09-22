class Api::V1::SessionsController < ApplicationController

  def create
    require "pry"; binding.pry
    user = User.find_by(user_params)
    if user
      render json: UserSerializer.new(new_user), status: 200
    else
      render json: "Bad credentials".to_json, status: 403
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
