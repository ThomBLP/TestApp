class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle

  validates :start_date, :end_date, presence: true
  validates :start_date, :end_date, comparison: { greater_than: :today }
end
