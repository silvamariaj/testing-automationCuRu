require 'rest-client'
require 'json'


Given(/^that I want to delete the data of the profile created with "([^"]*)" and "([^"]*)"$/) do |useric,password|

 puts "Deleting Profile..."
 
 
  $driver.manage.window.maximize
  $driver.find_element(:id, "username").send_keys useric
  $driver.find_element(:id, "password").send_keys password
  $driver.find_element(:class, "btn-primary").click
  
   begin
  
   $driver.find_element(:class, "alert-success").displayed?
   puts("Login successful")
   
    rescue Exception => e
        fail!(raise(ArgumentError.new('Failed Test - Login Failed"!')))   
        puts e.message
        Process.exit(0)
   
   end
 
end

Given(/^I enter into Interview Profile page and I search the profile "([^"]*)"$/) do|profile|
 
  found = 0
     
 if $FLAG_TEST_PRO == 1
 
  $driver.find_element(:xpath, "//a[@id='coordinator-menu']/span").click
  $driver.find_element(:xpath, "//li[contains(@class, 'dropdown pointer ng-scope open')]/ul[contains(@class, 'dropdown-menu')]/li[4]/a").click
  sleep(2)
  text = profile
  
  $driver.find_element(:id,"searchInterviewProfile").click
  $driver.find_element(:id,"searchInterviewProfile").send_keys profile
  sleep(2)
  
   lista_td = $driver.find_elements(:xpath, "html/body/div[2]/div/div/div[2]/table/tbody/tr")
   
    $cont_prof =  lista_td.count
     
    puts $cont_prof
    $row = 0
    
    num = 0
    
    for i in lista_td
       num = num + 1
    if $driver.find_element(:xpath, "//table/tbody/tr[" + num.to_s + "]/td[2]").text == text
     $row = num
     found = 1
     $id_profile = $driver.find_element(:xpath, "//table/tbody/tr[" + num.to_s + "]/td[1]/a").text
     
     puts "Profile id is:"
     puts $id_profile
     
    end
    end


    if found == 0 
        #fail!(raise(ArgumentError.new('Failed Test - The profile doesnt exist"!')))   
        #puts e.message
        #Process.exit(0)
         puts "No Profile to delete"
       $FLAG_TEST_PRO = 0
         $driver.find_element(:id, "account-menu").click
        $driver.find_element(:id, "logout").click
     else
       $FLAG_TEST_PRO = 1
    end
    
end #flag
 
 
    
 
end

Then(/^I delete the profile "([^"]*)"$/) do|profile|

if $FLAG_TEST_PRO == 1
   
   $driver.find_element(:xpath, "//table/tbody/tr[" + $row.to_s + "]/td[5]/div/button[3]").click
   sleep(1)
   $driver.find_element(:xpath,"html/body/div[1]/div/div/form/div[3]/button[2]").click
   sleep(2)
  
    text = profile
  
   lista_td = $driver.find_elements(:xpath, "html/body/div[2]/div/div/div[2]/table/tbody/tr")
   
    $cont_prof =  lista_td.count
     
    puts $cont_prof
    num = 0
    found = 0
    
    for i in lista_td
       num = num + 1
    if $driver.find_element(:xpath, "//table/tbody/tr[" + num.to_s + "]/td[2]").text == text
       
        found = 1
        fail!(raise(ArgumentError.new('Failed Test - The profile was not deleted"!')))   
        puts e.message
        Process.exit(0)
        
    end
 end
 
 
 if found == 0
       puts "No Profile to delete!"   
 end
   
   $driver.find_element(:id, "account-menu").click
   $driver.find_element(:id, "logout").click

end  
 

  # sleep(1)
  # $driver.close
   
     # $driver.find_element(:id, "account-menu").click
  # $driver.find_element(:id, "logout").click
  # sleep(1)
  # $driver.close
  # 
  #response = RestClient.delete  $origin_url + '/qa/interviewProfiles/' + $id_profile
  #puts "The result of delete profile"
  #puts response.code
  #
  #if response.code == 200
  #    puts "Profile deleted succesfully!"
  #else
  #    fail!(raise(ArgumentError.new('Failed Test - The profile wasnt deleted!')))    
  #      puts e.message
  #      Process.exit(0)
  #  
  #end
  

end
