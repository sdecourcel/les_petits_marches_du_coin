class Product < ApplicationRecord

  enum category_level: [:variety, :name, :sub_category, :category]

  has_many :firm_products
end
