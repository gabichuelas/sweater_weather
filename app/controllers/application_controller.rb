class ApplicationController < ActionController::API

  RESULTS ||= ResultsFacade.new

  def location_params
    params.permit(:location)
  end

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
