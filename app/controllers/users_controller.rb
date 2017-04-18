class UsersController < ApplicationController
  def show
    @personal_locations = Location.where(user: current_user)
  end

  def edit
  end

  def update
  end
end
