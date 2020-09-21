class Api::V1::BackgroundsController < ApplicationController
  def show
    
  end

  private

  RESULTS ||= ResultsFacade.new

  def location_params
    params.permit(:location)
  end
end
