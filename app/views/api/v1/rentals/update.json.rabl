if @rental.valid?
  object @rental
  attributes :id, :name, :daily_rate
  node(:status) {"200"}
  node(:success) {"true"}
  node(:message) {"Successfully Updated #{@rental.name}" }
else
  node(:status) {"500"}
  node(:success) {"false"}
  node(:message) {@rental.errors.full_messages}
end