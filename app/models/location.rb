class Location < ApplicationRecord
  belongs_to :owner, class_name: 'User', optional: true

  has_many :firms
  has_many :markets
end
