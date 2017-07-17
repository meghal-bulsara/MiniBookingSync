class Api::V1::BookingsController < Api::V1::ApiController
  skip_before_action :verify_authenticity_token
  before_action :check_api_key

  # List all Bookings
  def index
    @bookings = Booking.all
    render json: {success: true, status: 200, object: @bookings}
  end

  #create a booking
  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = @user.id
    if @booking.save
      render json: {success: true, status: 201, object: @booking}
    else
      render json: {success: false, status: 500, message: @booking.errors.full_messages.join(', ')}
    end
  end

  #show a particular booking
  def show
    @booking = Booking.find_by(id: params[:id])
    if @booking
      render json: {success: true, status: 200, object: @booking}
    else
      render json: {success: false, status: 404, message: "Not Found"}
    end
  end

  # update a booking
  def update
    @booking = Booking.find_by(id: params[:id])
    if !@booking.nil?
      if @booking.update_attributes(booking_params)
        render json: {success: true, status: 200, object: @booking}
      else
        render json: {success: false, status: 500, message: @booking.errors.full_messages.join(', ')}
      end
    else
      render json: {success: false, status:404, message: "Not found"}
    end
  end

  # destroy a booking
  def destroy
    @booking = Booking.find_by(id: params[:id])
    if !@booking.nil?
      if @booking.destroy
        render json: {success: true, status: 200, object: @booking}
      else
        render json: {success: false, status: 500, message: "Can not delete"}
      end
    else
      render json: {success: false, status:404, message: "Not found"}
    end
  end



  private
  def booking_params
    params[:booking].permit(:start_date, :end_date, :rental_id)
  end
end
