class MarketSupplier < ApplicationRecord

  enum role: [ :producer, :baskets_manager]

  # scope :producer, -> { where(role: :producer) }
  # scope :baskets_manager, -> { where(role: :baskets_manager) }

  belongs_to :user
  belongs_to :market

  validates :role, presence: true
end
