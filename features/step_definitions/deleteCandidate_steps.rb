
When(/^I enter the "([^"]*)" and I find the candidate$/) do |email1|

cand_flag = 0

if $FLAG_TEST_CAN == 1


     sleep(2)
     $element = wait_for_clickable_element(:xpath => "//html/body/div[2]/div/div/div/div[2]/div[1]/div/div[2]/input")
     $element.send_keys email1
     
     lista_td = $driver.find_elements(:xpath, "//table/tbody/tr")
    $email = email1
  
  for i in lista_td
                       
  if i.text.include?(email1) 
               
         cand_flag = 1      
  end
  
  end

end#flag

  if cand_flag == 1
      
       puts "The candidate was found!"
       
  else
       # fail!(raise(ArgumentError.new('Failed Test - The candidate wasnt found!')))    
       # puts e.message
       # Process.exit(0)
       puts "No candidate to delete"
       $FLAG_TEST_CAN = 0
    
  end
     
  
end

Then(/^I delete the candidate$/) do
  
if $FLAG_TEST_CAN == 1
     
  $driver.find_element(:xpath, "html/body/div[2]/div/div/div/div[2]/div[2]/table/tbody/tr[1]/td[8]/div/button[3]").click
  sleep(1)
  $driver.find_element(:xpath, "html/body/div[1]/div/div/form/div[3]/button[2]").click
  
     sleep(2)
     $element = wait_for_clickable_element(:xpath => "//html/body/div[2]/div/div/div/div[2]/div[1]/div/div[2]/input")
     $element.send_keys $email
  
    lista_td = $driver.find_elements(:xpath, "//table/tbody/tr")
  
  
  if lista_td.count == 0
    
    puts "Candidate was deleted successfully"
    
  else
    
        fail!(raise(ArgumentError.new('Failed Test - The candidate wasnt deleted!')))    
        puts e.message
        Process.exit(0)
    
  end
  
   $driver.find_element(:id, "account-menu").click
   $driver.find_element(:id, "logout").click
   sleep(1)
   $driver.close
   
end#flag 
  
  
  
end
