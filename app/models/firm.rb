class Firm < ApplicationRecord
  belongs_to :user
  belongs_to :location

  has_many :firm_products, dependent: :destroy
  has_many :products, through: :firm_products

  has_attachment :photo

  validates :name, presence: true, uniqueness: true
end
