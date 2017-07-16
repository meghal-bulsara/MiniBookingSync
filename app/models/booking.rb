class Booking < ApplicationRecord
  # Association booking belongs to rental
  belongs_to :rental
  belongs_to :user

  #validation
  validates_presence_of :start_date, :end_date, :price, :rental_id, :user_id, :booking_no
  validates_uniqueness_of :booking_no
  validates_numericality_of :user_id, :rental_id, :price, greater_than: 0
  validate :date_check_validation

  #callback 
  before_validation :generate_detail, on: :create
  before_validation :price_calculation

  # generate booking no and check condition
  def generate_random_string
    prefix = Array.new(3){[*"A".."Z"].sample}.join
    if prefix == 'EKA'
      generate_random_string
    end
    return prefix
  end

  def generate_detail
    prefix_string = generate_random_string
    postfix_string = Array.new(3){[*"A".."Z", *"0".."9"].sample}.join
    final_string= "#{prefix_string}#{postfix_string}"
    reserved_words = ["SELFIE", "BARNEY", "RACHEL", "MONICA", "ETIHAD", "AMAZON"]
    if reserved_words.include?(final_string)
      generate_detail
    end
    self.booking_no = final_string
  end

  #price calculation
  def price_calculation
    # convert seconds to days
    days = (self.end_date - self.start_date) / (24 * 60 * 60)
    if days == 0
      self.price = self.rental.daily_rate
    else
      self.price = days * self.rental.daily_rate
    end
    
  end

  # custom validation for start and end date 
  def date_check_validation
    if !self.start_date.nil? && !self.end_date.nil?
      if self.end_date < self.start_date
        self.errors.add(:end_date, "End date should be greater than or equal to start date")
      end
    end
  end

  # custom validation for start date greater than or equal to today's date
  def start_date_validation
    if !self.start_date.nil?
      if self.start_date < Date.today
        self.errors.add(:start_date, "Start date should be greater than or equal to today's date.")
      end
    end
  end

  # custom validation for date overlapping
  def check_for_date_overlap
    if !self.start_date.nil? && !self.end_date.nil?
      Booking.where('(start_date >= ? AND end_date <= ?) OR (start_date >= ? AND end_date <= ?)', self.start_date, self.start_date, self.end_date, self.end_date)
    end
  end

end
