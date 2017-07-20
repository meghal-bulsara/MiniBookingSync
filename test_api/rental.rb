require 'faker'

class Rental
  API = "http://localhost:3000/api/v1/rentals/"
  KEY = "1771947ba168d819d4385493f3d52fb8"

  def self.index_test
    response = HTTParty.get("#{API}?api_key=#{KEY}")
    result = JSON.parse(response.body)
    results = result["object"]
    results.each do |result|
      puts "------------------------------------- \n"
      puts "Id : #{result["id"]}"
      puts "Name : #{result["name"]}"
      puts "Daily Rate : #{result["daily_rate"]}"
      puts "------------------------------------- \n"
    end
  end

  def self.create_test
    response = HTTParty.post("#{API}/?api_key=#{KEY}",
                             :body => {
                               "name" => Faker::Company.name,
                               "daily_rate" => 100
                             }.to_json,
                             :headers => { "Content-Type" => 'application/json'})
    puts response
    puts "This API is Functional" if response["status"] == 201
    puts response["message"] if response["status"] == 500
  end

  def self.update_test
    index_test
    puts "Enter id for updating rental"
    id = gets.to_i

    #check_presence_validation
    response = HTTParty.put("#{API}/#{id}?api_key=#{KEY}",
                            :body => {
                              "name" => Faker::Company.name,
                              "daily_rate" => 100
                            }.to_json,
                            :headers => { "Content-Type" => 'application/json'})
    puts response
    puts "This API is Functional" if response["status"] == 200
    puts response["message"] if response["status"] == 500 || response["status"] == 404
  end

  def self.delete_test
    index_test
    puts "Enter id for destroy rental"
    id = gets.to_i

    response = HTTParty.delete("#{API}/#{id}?api_key=#{KEY}")
    puts response
    puts "This API is Functional" if response["status"] == 200
    puts response["message"] if response["status"] == 500 || response["status"] == 404
  end

  def self.show_test
    index_test
    puts "Enter id for find rental"
    id = gets.to_i

    response = HTTParty.get("#{API}/#{id}?api_key=#{KEY}")
    if response["status"] == 200
      puts "------------------------------------- \n"
      puts "Name : #{response["object"]["name"]}"
      puts "Daily Rate : #{response["object"]["daily_rate"]}"
      puts "------------------------------------- \n"
    else
      puts response['message']
    end
  end
end
