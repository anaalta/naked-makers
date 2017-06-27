class LocationsController < ApplicationController
  def index
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(response_id: params[:response_id], city: params[:city])
    @location.save
    redirect_to root_url
    flash[:notice] = "Data submitted"
  end

  private

  def location_params
    params.require(:location).permit(:response_id, :city)
  end
end
