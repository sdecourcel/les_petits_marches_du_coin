class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :firms
  has_many :locations
  has_many :markets

  has_many :market_suppliers
  has_many :sale_markets, through: :market_suppliers, source: :market, foreign_key: "market_id"

  validates :general_conditions, acceptance: true
end
