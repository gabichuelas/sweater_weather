class ApplicationController < ActionController::API

  RESULTS ||= ResultsFacade.new

  def location_params
    params.permit(:location)
  end
end
