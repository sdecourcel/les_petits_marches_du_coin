class MarketSupplier < ApplicationRecord
  belongs_to :producer
  belongs_to :market
end
