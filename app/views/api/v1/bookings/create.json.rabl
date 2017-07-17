if @booking.valid?
  object @booking
  attributes :id, :start_date, :end_date, :price, :booking_no
  child @user do
    attributes :email
  end
  node(:status) {200}
  node(:success) {"true"}
  node(:message) {"Successfully Created #{@booking.booking_no}" }
else
  node(:status) {500}
  node(:success) {"false"}
  node(:message) {@booking.errors.full_messages}
end