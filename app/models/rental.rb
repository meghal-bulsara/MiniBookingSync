class Rental < ApplicationRecord
  # Association rental has_many Bookings
  has_many :bookings

  # validation 
  validates_presence_of :name, :daily_rate
  validates_numericality_of :daily_rate, greater_than: 0
end
