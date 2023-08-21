class User < ApplicationRecord
  has_many :offers, dependent: :destroy
  has_many :bookings

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :age, presence: true, numericality: { only_integer: true }
  validates :phone_number, presence: true, numericality: { only_integer: true }
end
