class Product < ApplicationRecord

  enum category_level: [:variety, :name, :sub_category, :category]


  belongs_to :parent, class_name: 'Product'

  has_many :firm_products
  has_many :items, class_name: 'Product'

  validates :name, presence: true, uniqueness: true
  validates :category_level, presence: true
end
