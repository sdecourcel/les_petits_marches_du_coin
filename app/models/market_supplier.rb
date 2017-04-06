class MarketSupplier < ApplicationRecord

  enum role: [ :producer, :basket_manager]

  belongs_to :producer
  belongs_to :market

end
