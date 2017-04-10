class Market < ApplicationRecord

  enum week_day: [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]

  belongs_to :location
  belongs_to :user

  has_many :market_suppliers
  has_many :suppliers, through: :market_suppliers, class_name: "User"

  validates :week_day, presence: true
  validates :start_hour, presence: true
  validates :start_min, presence: true
  validates :stop_hour, presence: true
  validates :stop_min, presence: true
end
