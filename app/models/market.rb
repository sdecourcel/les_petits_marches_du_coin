class Market < ApplicationRecord

  enum week_day: [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]

  belongs_to :location
  belongs_to :user

  has_many :market_suppliers, dependent: :destroy
  has_many :suppliers, through: :market_suppliers, source: :user, foreign_key: "user_id"

  validates :week_day, presence: true
  validates :start_hour, presence: true
  validates :start_min, presence: true
  validates :stop_hour, presence: true
  validates :stop_min, presence: true
end
