class Api::V1::BackgroundsController < ApplicationController
  def show
    image = RESULTS.get_image(location_params[:location])
    render json: ImageSerializer.new(image)
  end

  private

  RESULTS ||= ResultsFacade.new

  def location_params
    params.permit(:location)
  end
end
