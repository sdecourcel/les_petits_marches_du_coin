class Product < ApplicationRecord

  enum category_level: [:variety, :species, :sub_category, :category]


  belongs_to :parent, class_name: 'Product', optional: true

  has_many :firm_products, dependent: :destroy
  has_many :sub_products, foreign_key: 'parent_id', class_name: 'Product', dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :category_level, presence: true
end
