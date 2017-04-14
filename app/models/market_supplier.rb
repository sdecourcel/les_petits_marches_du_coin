class MarketSupplier < ApplicationRecord

  belongs_to :user
  belongs_to :market
  # belongs_to :sale_market, class_name: "Market", foreign_key: "market_id"

end
