class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :offers, dependent: :destroy
  has_many :bookings

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :age, presence: true, numericality: { only_integer: true }
  validates :phone_number, presence: true, numericality: { only_integer: true }
end
