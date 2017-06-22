class LocationsController < ApplicationController

  # before_action :set_location, only: [:update]

  def new
    # byebug
    @location = Location.new
    respond_to do |format|
      format.html { render :new}
      format.js  # <-- will render `app/views/locations/new.js.erb`
    end
  end

  def create
    @location = Location.new(location_params)
    @location.user = current_user
    # byebug
    if @location.save
      respond_to do |format|
        format.html { redirect_to account_locations_path }
        format.js  # <-- will render `app/views/locations/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'locations/new' }
        format.js  # <-- idem
      end
    end
  end

  private

  def location_params
    params.require(:location).permit(:address, :name)
  end

  def set_location
    @location = Location.find(params[:id])
  end

end
