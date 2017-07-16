class Booking < ApplicationRecord
  # Association booking belongs to rental
  belongs_to :rental
  belongs_to :user

  #validation
  validates_presence_of :start_date, :end_date, :price, :rental_id, :user_id, :booking_no
  validates_uniqness_of :booking_no
  validates_numericality_of :user_id, :rental_id, :price, greater_than: 0
  validate :date_check_validation

  # custom validation for start and end date 
  def date_check_validation
    if !self.start_date.nil? && !self.end_date.nil?
      if self.start_date < self.end_date
        self.errors.add(:end_date, "End date should be greater than or equal to start date")
      end
    end
  end

  # custom validation for start date greater than or equal to today's date
  def start_date_validation
    if !start_date.nil?
      if self.start_date < Date.today
        self.errors.add(:start_date, "Start date should be greater than or equal to today's date.")
      end
    end
  end

end
