
Then(/^I get the Schedule Id using the "([^"]*)", "([^"]*)" and "([^"]*)"$/) do|name, email, profile|
  
cand_flag = 0
  
if $FLAG_TEST_SCH == 1
     
   $driver.manage.window.maximize
   sleep(2)
   
   $driver.find_element(:tag_name , "input").click
   $driver.find_element(:tag_name , "input").send_keys email
   sleep(2)
   
    lista_td = $driver.find_elements(:xpath, "html/body/div[2]/div/div/div/div[3]/table/tbody/tr/td")
   
   
     for i in lista_td
                       
       #puts i.text
                       
       if i.text.include?(name) 
               
         cand_flag = 1
         
         link = $driver.find_element(:xpath, "html/body/div[2]/div/div/div/div[3]/table/tbody/tr/td[8]/div/button[1]")
         href = link.attribute("href")
         #puts href

         id_number = href.split("/")
         $number_id_prof_final = id_number[-1]
         puts "The Id of the Schedule to delete is:"
         puts $number_id_prof_final
       end
   
     end
     
     if cand_flag == 0
       # fail!(raise(ArgumentError.new('Failed Test - The schedule for the candidate dont appear!')))    
       # puts e.message
       # Process.exit(0)
       puts "No Schedule to delete"
       $FLAG_TEST_SCH = 0
        $driver.find_element(:id, "account-menu").click
        $driver.find_element(:id, "logout").click
     else
       $FLAG_TEST_SCH = 1
     end
     
 end#flag
  
end

Then(/^I delete the Schedule$/) do
  
if $FLAG_TEST_SCH == 1

  response = RestClient.delete $origin_url + '/qa/interviewSchedules/' + $number_id_prof_final.to_s
  puts response.code
  
  
   if response.code == 200
    puts "Interview Schedule deleted OK!"
   
   else
    fail!(raise(ArgumentError.new('Failed Test - Something wrong happens when tried to delete the schedule!')))    
    puts e.message
    Process.exit(0)
   
end

   $driver.find_element(:id, "account-menu").click
   $driver.find_element(:id, "logout").click
end #flag
          

   #sleep(1)
   #$driver.close
  
end


