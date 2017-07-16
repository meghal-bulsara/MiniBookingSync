if !@rentals.empty?
  collection @rentals
  attributes :id, :name, :daily_rate
  node(:status) {"200"}
  node(:success) {"true"}
  node(:message) {"OK"}
else
  node(:status) {"500"}
  node(:success) {"false"}
  node(:message) {"No rentals added yet"}
end