require 'rest-client'
require 'json'


Given(/^that I want to prepare the data to run the automated tests$/) do
 $driver.close
 puts "Creating Users..."
 
end

Then(/^I create the user HR "([^"]*)" with password "([^"]*)"$/) do |userhr,password|
  
  response = RestClient.post  $origin_url + '/qa/createUser', {'id' => nil,'login' => userhr,'firstName' => 'Human','lastName' => 'Resources','email'=> userhr.to_s + '@yopmail.com','activated' => true,'langKey' => 'en','createdBy' => 'qa','createdDate' => nil,'lastModifiedBy' => nil,'lastModifiedDate' => nil,'resetDate' => nil,'resetKey' => nil,'authorities' =>['ROLE_HR','ROLE_ADMIN']}.to_json, :content_type => :json, :accept => :json
  puts "The result of create " + userhr
  puts response.code
  
  if response.code == 201
      puts "User " + userhr + " created succesfully!"
  else
      fail!(raise(ArgumentError.new('Failed Test - The user HR wasnt created!')))    
        puts e.message
        Process.exit(0)
    
  end
   

end

Then(/^I create the user IC "([^"]*)" with password "([^"]*)"$/) do |useric,password|
 
  response = RestClient.post  $origin_url + '/qa/createUser', {'id' => nil,'login' => useric,'firstName' => 'Interview','lastName' => 'Coordinator','email'=> useric.to_s + '@yopmail.com','activated' => true,'langKey' => 'en','createdBy' => 'qa','createdDate' => nil,'lastModifiedBy' => nil,'lastModifiedDate' => nil,'resetDate' => nil,'resetKey' => nil,'authorities' =>['ROLE_INTERVIEW_COORDINATOR']}.to_json, :content_type => :json, :accept => :json
  puts "The result of create " + useric
  
  if response.code == 201
       puts "User " + useric + " created succesfully!"
  else
      fail!(raise(ArgumentError.new('Failed Test - The user IC wasnt created!')))    
        puts e.message
        Process.exit(0)
    
  end
  
end

Then(/^I create the user EVA "([^"]*)" with name "([^"]*)" and password "([^"]*)"$/) do |usereva,evaname,password|
  
  response = RestClient.post  $origin_url + '/qa/createUser', {'id' => nil,'login' => usereva,'firstName' => evaname,'lastName' => 'Automation role','email'=> usereva.to_s + '@yopmail.com','activated' => true,'langKey' => 'en','createdBy' => 'qa','createdDate' => nil,'lastModifiedBy' => nil,'lastModifiedDate' => nil,'resetDate' => nil,'resetKey' => nil,'authorities' =>['ROLE_EVALUATOR']}.to_json, :content_type => :json, :accept => :json
  puts "The result of create " + usereva
  
  if response.code == 201
      puts "User " + usereva + " created succesfully!"
  else
      fail!(raise(ArgumentError.new('Failed Test - The user EVA wasnt created!')))    
        puts e.message
        Process.exit(0)
    
  end
  
end


