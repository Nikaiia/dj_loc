class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :offers, dependent: :destroy
  has_many :bookings
  has_many :reviews, dependent: :destroy
  has_one_attached :photo

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :role, presence: true

  # validates :age, presence: true, numericality: { only_integer: true }
  # validates :phone_number, presence: true, numericality: { only_integer: true }
end
