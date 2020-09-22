class Api::V1::SessionsController < ApplicationController

  def create
    # change to user_params[:email]
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: UserSerializer.new(user), status: 200
    else
      render json: "401: Bad credentials or user not found".to_json, status: 401
    end
  end
end
