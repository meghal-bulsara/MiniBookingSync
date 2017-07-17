class Api::V1::RentalsController < Api::V1::ApiController
  skip_before_action :verify_authenticity_token
  before_action :check_api_key

  # List all rentals
  def index
    @rentals = Rental.all
    render json: {success: true, status: 200, object: @rentals}
  end

  #create a rental
  def create
    @rental = Rental.new(rental_params)
    #@rental.save
    if @rental.save
      render json: {success: true, status: 201, object: @rental}
    else
      render json: {success: false, status: 500, message: @rental.errors.full_messages.join(', ')}
    end
  end

  #show a particular rental
  def show
    @rental = Rental.find_by(id: params[:id])
    if @rental
      render json: {success: true, status: 200, object: @rental}
    else
      render json: {success: false, status: 404, message: "Not Found"}
    end
  end

  # update a rental
  def update
    @rental = Rental.find_by(id: params[:id])
    if !@rental.nil?
      if @rental.update_attributes(rental_params)
        render json: {success: true, status: 200, object: @rental}
      else
        render json: {success: false, status: 500, message: @rental.errors.full_messages.join(', ')}
      end
    else
      render json: {success: false, status:404, message: "Not found"}
    end
  end

  # destroy a rental
  def destroy
    @rental = Rental.find_by(id: params[:id])
    if !@rental.nil?
      if @rental.destroy
        render json: {success: true, status: 200, object: @rental}
      else
        render json: {success: false, status: 500, message: "Can Not delete rental"}
      end
    else
      render json: {success: false, status:404, message: "Not found"}
    end

  end

  private
  def rental_params
    params[:rental].permit(:name, :daily_rate)
  end
end
