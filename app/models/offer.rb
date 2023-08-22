class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :availability, presence: true
  validates :pricing, presence: true, numericality: { only_integer: true }
  validates :style, presence: true
end
