require 'rest-client'
require 'json'


Given(/^that I want to delete the data of the users$/) do
 $driver.close
 puts "Deleting Users..."
 
end

Then(/^I delete the user HR "([^"]*)"$/) do |userhr|
  
  response = RestClient.delete  $origin_url + '/qa/deleteUser/' + userhr
  puts "The result of delete " + userhr
  puts response.code
  
  if response.code == 200
      puts "User HR deleted succesfully!"
  else
      fail!(raise(ArgumentError.new('Failed Test - The user HR wasnt deleted!')))    
        puts e.message
        Process.exit(0)
    
  end
   

end

Then(/^I delete the user IC "([^"]*)"$/) do |useric|
 
   response = RestClient.delete  $origin_url + '/qa/deleteUser/' + useric
  puts "The result of delete " + useric
  puts response.code
  
  if response.code == 200
      puts "User IC deleted succesfully!"
  else
      fail!(raise(ArgumentError.new('Failed Test - The user IC wasnt deleted!')))    
        puts e.message
        Process.exit(0)
    
  end
  
end

Then(/^I delete the user EVA "([^"]*)"$/) do |usereva|
  
   response = RestClient.delete  $origin_url + '/qa/deleteUser/' + usereva
  puts "The result of delete " + usereva
  puts response.code
  
  if response.code == 200
      puts "User EVA deleted succesfully!"
  else
      fail!(raise(ArgumentError.new('Failed Test - The user EVA wasnt deleted!')))    
        puts e.message
        Process.exit(0)
    
  end
  
end
