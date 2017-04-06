class Product < ApplicationRecord

  enum category_level: [:variety, :name, :sub_category, :category]

  has_many :firm_products

  validates :name, presence: true
  validates :category_level, presence: true
end
