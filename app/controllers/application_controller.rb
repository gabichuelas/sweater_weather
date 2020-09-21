class ApplicationController < ActionController::API

  private
  RESULTS ||= ResultsFacade.new

  def location_params
    params.permit(:location)
  end
end
