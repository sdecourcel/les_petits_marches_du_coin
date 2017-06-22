class Account::LocationsController < ApplicationController

  before_action :set_location, only: [:update]

  def index
    @personal_locations = Location.where(user: current_user)
  end

end
