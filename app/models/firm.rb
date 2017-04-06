class Firm < ApplicationRecord
  belongs_to :user
  belongs_to :location

  has_many :firm_products
  has_many :products, through: :firm_products
end
