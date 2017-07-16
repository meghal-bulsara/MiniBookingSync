class Api::V1::RentalsController < Api::V1::ApiController
  skip_before_action :verify_authenticity_token
  before_action :check_api_key

  # List all rentals
  def index
    @rentals = Rental.all
  end

  #create a rental
  def create
    @rental = Rental.new(rental_params)
    @rental.save
  end

  #show a particular rental
  def show
    @rental = Rental.find_by(id: params[:id])
  end

  # update a rental
  def update
    @rental = Rental.find_by(id: params[:id])
    if !@rental.nil?
      @rental.update_attributes(rental_params)
    end  
  end

  # destroy a rental
  def destroy
    @rental = Rental.find_by(id: params[:id])
    if !@rental.nil?
      @rental.destroy
    end
    
  end

  private
  def rental_params
    params[:rental].permit(:name, :daily_rate)
  end
end
