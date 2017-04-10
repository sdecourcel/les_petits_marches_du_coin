class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :firms
  has_many :markets, foreign_key: :manager_id, class_name: "Market"
  has_many :locations, foreign_key: "owner_id", class_name: "Location"


  # has_many :producer_market_suppliers, -> { where market_suppliers: {role: :producer} }, source: :market_suppliers, foreign_key: :user_id
  has_many :producer_market_suppliers, -> { MarketSupplier.producer }, foreign_key: "user_id", class_name: "MarketSupplier"
  has_many :baskets_market_suppliers, -> { MarketSupplier.baskets_manager }, source: :market_suppliers, foreign_key: :user_id

  has_many :products_markets, -> { MarketSupplier.producer }, source: :markets, through: :market_suppliers
  has_many :baskets_markets, -> { MarketSupplier.baskets_manager }, source: :markets, through: :market_suppliers


  #  scope :producer_market_suppliers, -> do |role|
  #   joins(:market_suppliers).
  #   where( market_suppliers: {role: :producer} )
  # end

  # has_many :producer_market_suppliers, -> { where market_suppliers: {role: :producer} } , source: :market_suppliers
  # has_many :basket_market_suppliers, -> { where role: :basket_manager }, source: :market_suppliers

  # has_many :producer_markets, -> { where market_suppliers: {role: :producer} }, through: :market_suppliers, source: :markets #merge(Item.in_stock)
  # has_many :basket_markets, through: :basket_market_suppliers, source: :markets
end
