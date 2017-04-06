class Market < ApplicationRecord

  belongs_to :location
  belongs_to :manager, class_name: 'User'

  has_many :producer_market_suppliers,  -> { where role: :producer }, source: :market_suppliers
  has_many :basket_market_suppliers,  -> { where role: :basket_manager }, source: :market_suppliers

  has_many :producers, source: :users, through: :producer_market_suppliers
  has_many :basket_managers, source: :users, through: :basket_market_suppliers

  validates :week_day, presence: true
  validates :start_time, presence: true
  validates :stop_time, presence: true

end
