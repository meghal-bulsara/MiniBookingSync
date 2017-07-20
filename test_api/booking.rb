require 'faker'
require 'httparty'
require 'pry'

class Booking
  API = "http://localhost:3000/api/v1/bookings"
  KEY = "1771947ba168d819d4385493f3d52fb8"

  def self.index_test
    #puts "#{API}?api_key=#{KEY}"
    response = HTTParty.get("#{API}?api_key=#{KEY}")
    result = JSON.parse(response.body)
    results = result["object"]
    results.each do |result|
      puts "--------------------------------------------- \n"
      puts "id : #{result["id"]} "
      puts "Start Date : #{result["start_date"]}"
      puts "End Date : #{result["end_date"]}"
      puts "Price : #{result["price"]}"
      puts "User Id : #{result["user_id"]}"
      puts "Rental Id : #{result["rental_id"]}"
      puts "Booking Id : #{result["booking_no"]}"
      puts "---------------------------------------------- \n"
    end
  end

  def self.create_test
    response = HTTParty.post("#{API}?api_key=#{KEY}", :body =>{
                               "start_date" => Date.today,
                               "end_date" => Faker::Date.forward(10),
                               "rental_id" => 1
                             }.to_json,
                             :headers => { "Content-Type" => 'application/json'})
    puts "This API is Functional" if response["status"] == 201
    puts response["message"] if response["status"] == 500
  end

  def self.update_test
    index_test
    puts "Enter id for updating booking"
    id = gets.to_i
    response = HTTParty.put("#{API}/#{id}?api_key=#{KEY}", :body =>{
                              "start_date" => Date.new(2017, 07, 20),
                              "end_date" => Faker::Date.forward(10),
                              "rental_id" => 1
                            }.to_json,
                            :headers => { "Content-Type" => 'application/json'})
    puts "This API is Functional" if response["status"] == 200
    puts response["message"] if response["status"] == 500 || response["status"] == 404
  end

  def self.delete_test
    index_test
    puts "Enter id for destroy booking"
    id = gets.to_i

    response = HTTParty.delete("#{API}/#{id}?api_key=#{KEY}")
    puts response["status"]
    puts "This API is Functional" if response["status"] == 200
    puts response["message"] if response["status"] == 500 || response["status"] == 404
  end

  def self.show_test
    index_test
    puts "Enter id for find booking"
    id = gets.to_i
    response = HTTParty.get("#{API}/#{id}?api_key=#{KEY}")
    if response["status"] == 200
      #puts response
      puts "--------------------------------------------- \n"
      puts "id : #{response["object"]["id"]} "
      puts "Start Date : #{response["object"]["start_date"]}"
      puts "End Date : #{response["object"]["end_date"]}"
      puts "Price : #{response["object"]["price"]}"
      puts "User Id : #{response["object"]["user_id"]}"
      puts "Booking Id : #{response["object"]["booking_no"]}"
      puts "---------------------------------------------- \n"
    else
      puts response["message"]
    end
  end
end
