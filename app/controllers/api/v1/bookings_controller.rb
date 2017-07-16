class Api::V1::BookingsController < Api::V1::ApiController
  skip_before_action :verify_authenticity_token
  before_action :check_api_key

  # List all Bookings
  def index
    @bookings = Booking.all
  end

  #create a booking
  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = @user.id
    binding.pry
    @booking.save
  end

  #show a particular booking
  def show
    @booking = Booking.find_by(id: params[:id])
  end

  # update a booking
  def update
    @booking = Booking.find_by(id: params[:id])
    if !@booking.nil?
      @booking.update_attributes(booking_params)
    end  
  end

  # destroy a booking
  def destroy
    @booking = Booking.find_by(id: params[:id])
    if !@booking.nil?
      @booking.destroy
    end
    
  end

  private
  def booking_params
    params[:booking].permit(:start_date, :end_date, :rental_id)
  end
end
