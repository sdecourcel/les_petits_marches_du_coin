class Account::FirmsController < ApplicationController

  # before_action :set_firm, only: [:update]

  def index
    @firms = Firm.where(user: current_user)
  end

end
