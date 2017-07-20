class Location < ApplicationRecord
  belongs_to :user, optional: true

  has_many :firms, inverse_of: :location
  has_many :markets

  accepts_nested_attributes_for :firms, reject_if: :all_blank, allow_destroy: true

  validates :address, presence: true
  # validates :unique_name, presence: true, uniqueness: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  after_validation :underscorize, if: :address_changed?

  scope :market_places, -> { joins(:markets).where({ markets: { market_place: true } }) }
  scope :basket_places, -> { joins(markets: { suppliers: { firms: :products } } ).where({ products: { name: 'Paniers' } }) }

  private

  def underscorize
    self.unique_name = self.address.parameterize(separator: '_')
  end




end
