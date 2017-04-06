class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :firms
  has_many :markets

  has_many :producer_market_suppliers, -> { where role: :producer } , source: :market_suppliers
  has_many :basket_market_suppliers, -> { where role: :basket_manager }, source: :market_suppliers

  has_many :producer_markets, source: :markets, through: :producer_market_suppliers
  has_many :basket_markets, source: :markets, through: :basket_market_suppliers
end
