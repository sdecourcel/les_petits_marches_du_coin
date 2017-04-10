class Product < ApplicationRecord

  enum category_level: [:variety, :species, :sub_category, :category]


  belongs_to :parent, class_name: 'Product'

  has_many :firm_products
  has_many :items, foreign_key: 'parent_id', class_name: 'Product'

  validates :name, presence: true, uniqueness: true
  validates :category_level, presence: true
end
