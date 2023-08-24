class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :offer

  validates :date, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
end
