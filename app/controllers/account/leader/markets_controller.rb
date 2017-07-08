class Account::Leader::MarketsController < ApplicationController

  # before_action :set_market, only: [:update]

  def index
    @markets = current_user.markets
  end

end
