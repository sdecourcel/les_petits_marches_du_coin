class Location < ApplicationRecord
  belongs_to :user, optional: true

  has_many :firms
  has_many :markets

  validates :address, presence: true
  # validates :unique_name, presence: true, uniqueness: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  after_validation :underscorize, if: :address_changed?

  private

  def underscorize
    byebug
    self.unique_name = self.address.parameterize(separator: '_')
  end

end
