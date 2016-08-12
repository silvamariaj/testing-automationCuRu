
Given(/^enter into Schedule Request page$/) do
  $driver.find_element(:id, "hr-menu").click
  $driver.find_element(:xpath, "//li[contains(@class, 'dropdown pointer ng-scope open')]/ul[contains(@class, 'dropdown-menu')]/li[2]/a/span[contains(@class, 'hidden-sm')]").click
end

When(/^HR press the New button$/) do
   $driver.find_element(:class, "md-button").click
     $driver.manage.window.maximize
end

When(/^enter the fields "([^"]*)", "([^"]*)" and "([^"]*)"$/) do |candidate, profile, evaluator|

     sleep(3)
     
     $driver.find_element(:xpath,"html/body/div[2]/div/div/div/form/md-switch/div[1]/div[2]/div").click
     
      #Ask for Candidate field
      element = wait_for_clickable_element(:xpath => "//input[@name='candidateAutocomplete']")
      sleep(1)
         
      begin
        element.displayed?
        element.click
         #Enter the data into Candidate field
        element.send_keys candidate
        element.send_keys :arrow_down
        element.send_keys :enter
    
           
        rescue Exception => e
        fail!(raise(ArgumentError.new('Failed Test - Candidate field is not able!')))    
        puts e.message
        Process.exit(0)
      end
      
     puts "NAME"
     puts  $driver.find_element(:xpath, "//input[@name='candidateAutocomplete']").value
  
     $driver.find_element(:xpath, "//input[@name='profileAutocomplete']").click
          
     $driver.find_element(:xpath, "//input[@name='profileAutocomplete']").send_keys profile
     $driver.find_element(:xpath, "//input[@name='profileAutocomplete']").send_keys :arrow_down
     $driver.find_element(:xpath, "//input[@name='profileAutocomplete']").send_keys :enter
     sleep(1)

     md_selects = $driver.find_elements(:tag_name,"md-select")
     puts md_selects.count
     
     puts "PROFILE"
     puts  $driver.find_element(:xpath, "//input[@name='profileAutocomplete']").value
     
     for i in md_selects
       
       if i.attribute("name") == "evaluatorsSelect"

        i.click
        break
       end
              
     end
     
    sleep(1)
     var = $driver.find_elements(:class, "_md-text")

 ##Search for the Evaluator
 for i in var
     
     #If Evaluator is found
   if i.text == evaluator
     
     puts "EVALUATOR:"
     puts i.text
     
        #Select the Evaluator
           i.click
        sleep(1)    
        
         el = $driver.find_elements(:class, "_md-text")
         $driver.action.send_keys(el, :tab).perform
        
        sleep(2) 
        $driver.action.send_keys(el, :tab).perform
    
     
      $driver.find_element(:tag_name , "textarea").click
      $driver.find_element(:tag_name , "textarea").clear
 
      
     sleep(1)
     
     elem = $driver.find_elements(:tag_name, "button")
     
     sleep(1)
     
     for i in elem
       
       if i.attribute("aria-label") == "Save"
       # i.send_keys :tab
       i.click
      
        break
       end
             
       
     end
          
         break       
        
   end
      
 end#for
  
    
end

When(/^enter fields "([^"]*)", "([^"]*)" and "([^"]*)"$/) do |datetime, candidate, profile|

  sleep(3)

  #Ask for DateTime field
  $driver.find_element(:xpath, "/html/body/div[2]/div/div/div/form/p/input").click
  $driver.find_element(:xpath, "/html/body/div[2]/div/div/div/form/p/input").clear
  $driver.find_element(:xpath, "/html/body/div[2]/div/div/div/form/p/input").send_keys datetime


  #Ask for Candidate field
  element = wait_for_clickable_element(:xpath => "//input[@name='candidateAutocomplete']")
  sleep(1)

  begin
    element.displayed?
    element.click
    #Enter the data into Candidate field
    element.send_keys candidate
    element.send_keys :arrow_down
    element.send_keys :enter


  rescue Exception => e
    fail!(raise(ArgumentError.new('Failed Test - Candidate field is not able!')))
    puts e.message
    Process.exit(0)
  end

  puts "NAME"
  puts  $driver.find_element(:xpath, "//input[@name='candidateAutocomplete']").value

  $driver.find_element(:xpath, "//input[@name='profileAutocomplete']").click

  $driver.find_element(:xpath, "//input[@name='profileAutocomplete']").send_keys profile
  $driver.find_element(:xpath, "//input[@name='profileAutocomplete']").send_keys :arrow_down
  $driver.find_element(:xpath, "//input[@name='profileAutocomplete']").send_keys :enter
  sleep(1)

  puts "PROFILE"
  puts  $driver.find_element(:xpath, "//input[@name='profileAutocomplete']").value


end

And(/^enter "([^"]*)" and "([^"]*)"$/) do |evaluator1, evaluator2|

  md_selects = $driver.find_elements(:tag_name,"md-select")
  puts md_selects.count

  for i in md_selects
    if i.attribute("name") == "evaluatorsSelect"
      i.click
      el = $driver.find_elements(:class, "_md-text")
      break
    end
  end

  i.send_keys evaluator2
  sleep(1)
  i.send_keys evaluator1
  $driver.action.send_keys(el, :tab).perform

=begin
  for i in md_selects
    if i.attribute("name") == "evaluatorsSelect"
      i.click
      break
    end
  end

  i.send_keys evaluator2
  $driver.action.send_keys(el, :tab).perform
=end

end

And(/^add a "([^"]*)" and save the schedule$/) do |comment|

  $driver.find_element(:tag_name , "textarea").click
  $driver.find_element(:tag_name , "textarea").clear
  $driver.find_element(:tag_name , "textarea").send_keys comment

  sleep(1)

  elem = $driver.find_elements(:tag_name, "button")

  sleep(1)

  for i in elem

    if i.attribute("aria-label") == "Save"
      # i.send_keys :tab
      i.click

      break
    end


  end

end


When(/^HR search the "([^"]*)" schedule, and clicks the link in order to display main page of exam$/) do |candidate|

  sleep(1)
  puts "Searching candidate"
  #Enter candidate name for search
  $driver.find_element(:tag_name , "input").click

  name_can = candidate.split(" ")
  name_can_final = name_can.first

  $driver.find_element(:tag_name , "input").click
  sleep(1)
  $driver.find_element(:tag_name , "input").clear
  sleep(1)
  $driver.find_element(:tag_name , "input").send_keys name_can_final
  sleep(2)

  puts "Name searched:"
  puts  $driver.find_element(:tag_name , "input").value

  sleep(2)

  begin

    $driver.find_element(:link, candidate).displayed?
    puts("The added scheduled was founded!")

  rescue Exception => e
    fail!(raise(ArgumentError.new('Failed Test - The schedule dont appear!')))
    puts e.message
    Process.exit(0)

  end

  sleep(1)
  $driver.find_element(:xpath, "/html/body/div[2]/div/div/div/div[3]/table/tbody/tr[1]/td[8]/div/button[3]").click


  sleep(2)



end



Then(/^the interview for the candidate "([^"]*)" have status Scheduled$/) do |candidate|
  
  
  #$driver.navigate.to 'http://staffing-qa.nisumlatam.com:8080/#/'
   $driver.navigate.to $origin_url + '/#/'
   $driver.manage.window.maximize
   sleep(2)
   puts $driver.find_element(:xpath,"html/body/div[2]/div/div/div/div[2]/div/div/h1").text
   
   $driver.navigate.to $origin_url + '/#/schedule-request'
   #$driver.navigate.to 'http://staffing-qa.nisumlatam.com:8080/#/schedule-request'
   sleep(2)
   
   puts "Searching candidate"
   #Enter candidate name for search
   $driver.find_element(:tag_name , "input").click
   
   name_can = candidate.split(" ")
   name_can_final = name_can.first
    
   $driver.find_element(:tag_name , "input").click
   sleep(1)
   $driver.find_element(:tag_name , "input").clear
   sleep(1)
   $driver.find_element(:tag_name , "input").send_keys name_can_final
   sleep(2)

   puts "Name searched:"
   puts  $driver.find_element(:tag_name , "input").value
            
  sleep(2)
 
    
  begin
   
       $driver.find_element(:link, candidate).displayed?
       puts("The added scheduled was founded!")
       
        rescue Exception => e
        fail!(raise(ArgumentError.new('Failed Test - The schedule dont appear!')))    
        puts e.message
        Process.exit(0)
   
  end
  
   $driver.find_element(:id, "account-menu").click
   $driver.find_element(:id, "logout").click
   sleep(1)
   $driver.close
end

