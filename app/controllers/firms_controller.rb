class FirmsController < ApplicationController

  # before_action :set_firm, only: [:update]

  def new
    @firm = Firm.new
    # @firm.user = current_user
    @location = Location.new
    respond_to do |format|
      format.html { render :new}
      format.js  # <-- will render `app/views/firms/new.js.erb`
    end
  end

  def create
    @firm = Firm.new(firm_params)
    @firm.user = current_user
    # byebug
    if @firm.save
      respond_to do |format|
        format.html { redirect_to account_firms_path }
        format.js  # <-- will render `app/views/firms/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'firms/new' }
        format.js  # <-- idem
      end
    end
  end

  private

  def firm_params
    params.require(:firm).permit(:name, :description, location_attributes: [:id, :address, :_destroy])
  end


end
