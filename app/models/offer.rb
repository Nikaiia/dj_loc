class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  belongs_to :review, optional: true

  validates :availability, presence: true
  validates :pricing, presence: true, numericality: { only_integer: true }
  validates :style, presence: true
  validate :availability_after_today

  private

  def availability_after_today
    errors.add(:availability, "must be after today") if availability.present? && availability < Date.current
  end

end
