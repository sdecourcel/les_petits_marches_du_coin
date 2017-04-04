class Firm < ApplicationRecord
  belongs_to :user
  belongs_to :location
end
