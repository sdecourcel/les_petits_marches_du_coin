class Market < ApplicationRecord

  enum week_day: [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]

  belongs_to :location
  belongs_to :manager, class_name: 'User'

  # -> { MarketSupplier.producer },
  has_many :products_market_suppliers, class_name: "MarketSupplier", foreign_key: :market
  # has_many :baskets_market_suppliers, -> { MarketSupplier.baskets_manager }, source: :market_suppliers, foreign_key: :market_id

  # has_many :producer_suppliers, -> { MarketSupplier.producer }, source: :users, through: :market_suppliers
  # has_many :baskets_manager_suppliers, -> { MarketSupplier.producer }, source: :users, through: :market_suppliers

  # has_many :producer_market_suppliers,  -> { where role: :producer }, source: :market_suppliers
  # has_many :basket_market_suppliers,  -> { where role: :basket_manager }, source: :market_suppliers

  # has_many :producers, source: :users, through: :producer_market_suppliers
  # has_many :basket_managers, source: :users, through: :basket_market_suppliers

  validates :week_day, presence: true
  validates :start_time, presence: true
  validates :stop_time, presence: true

end
