class Account::Supplier::MarketsController < ApplicationController

  # before_action :set_market, only: [:update]

  def index
    @markets = current_user.sale_markets
  end

end
