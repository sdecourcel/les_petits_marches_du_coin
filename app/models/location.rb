class Location < ApplicationRecord
  belongs_to :user, optional: true

  has_many :firms
  has_many :markets

  validates :address, presence: true
  validates :unique_name, presence: true, uniqueness: true
end
