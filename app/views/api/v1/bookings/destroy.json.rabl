if @booking.nil?
  node(:status) {"404"}
  node(:success) {"false"}
  node(:message) {"Booking id #{params[:id]} not found" }
else
  node(:status) {"200"}
  node(:success) {"true"}
  node(:message) {"Successfully Deleted #{@booking.booking_no}" }
end