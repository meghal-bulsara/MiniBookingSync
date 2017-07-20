require './booking'
require './rental'

continue = 'y'
while  continue == 'y'
  puts "Enter your choice for check API \n1.Rental \n2.Booking"
  choice = gets.to_i
  puts choice
  puts "Enter your test action"
  puts "1.Index\n2.Create \n3.Update \n4.Destroy\n5.Show"
  action = gets.to_i
  begin
    if choice == 1
      case action
      when 1
        Rental.index_test
      when 2
        Rental.create_test
      when 3
        Rental.update_test
      when 4
        Rental.delete_test
      when 5
        Rental.show_test
      else
        puts "Invalid Action"
      end
    elsif choice == 2
      case action
      when 1
        Booking.index_test
      when 2
        Booking.create_test
      when 3
        Booking.update_test
      when 4
        Booking.delete_test
      when 5
        Booking.show_test
      else
        puts "Invalid Action"
      end
    else
      puts "Invalid choice"
    end
  rescue Errno::ECONNREFUSED
    puts 'can not connect to server'
  end

  puts "Do you want to continue (y/n)"
  continue = gets.chomp
end
