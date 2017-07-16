if !@bookings.empty?
  collection @bookings
  attributes :id, :start_date, :end_date, :price, :booking_no
  child @user do
    attributes :email
  end
  node(:status) {"200"}
  node(:success) {"true"}
  node(:message) {"OK"}
else
  node(:status) {"500"}
  node(:success) {"false"}
  node(:message) {"No booking added yet"}
end