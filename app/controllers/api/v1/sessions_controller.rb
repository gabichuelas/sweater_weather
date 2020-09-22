class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: UserSerializer.new(user), status: 200
    else
      render json: "403: Bad credentials or user not found".to_json, status: 403
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
