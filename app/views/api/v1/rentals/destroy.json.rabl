if @rental.nil?
  node(:status) {"404"}
  node(:success) {"false"}
  node(:message) {"Rental id #{params[:id]} not found" }
else
  node(:status) {"200"}
  node(:success) {"true"}
  node(:message) {"Successfully Deleted #{@rental.name}" }
end