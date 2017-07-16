if @booking.nil?
  node(:status) {"404"}
  node(:success) {"false"}
  node(:message) {"Booking id #{params[:id]} not found" }
else
  object @booking
  attributes :id, :start_date, :end_date, :price, :booking_no
  child @user do
    attributes :email
  end
  node(:status) {"200"}
  node(:success) {"true"}
  node(:message) {"OK"}
end