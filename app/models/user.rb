class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :firms
  has_many :markets
  has_many :locations

  has_many :market_suppliers
  has_many :sale_markets, through: :market_suppliers, class_name: "Market"
end
