if @rental.nil?
  node(:status) {"404"}
  node(:success) {"false"}
  node(:message) {"Rental id #{params[:id]} not found" }
else
  object @rental
  attributes :id, :name, :daily_rate
  node(:status) {"200"}
  node(:success) {"true"}
  node(:message) {"OK"}
end