
Given(/^enter into Candidate's page$/) do
  $driver.find_element(:id, "hr-menu").click
  $driver.find_element(:xpath, "//li[contains(@class, 'dropdown pointer ng-scope open')]/ul[contains(@class, 'dropdown-menu')]/li[1]/a").click
end

When(/^HR press the Create New Candidate button$/) do 
$driver.find_element(:xpath, "//div[contains(@class, 'col-xs-4 no-padding-left')]/button[contains(@class, 'btn btn-primary')]/span[2]").click
sleep(2)
end

When(/^enter the fields "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)","([^"]*)" and "([^"]*)"$/) do |name, surname, email, redmineid, phone, skypeid|
  
  sleep(1)
  element1 = wait_for_clickable_element(:id => "field_name")
         
      begin
        element1.displayed?
        element1.click
        element1.clear
        element1.send_keys name
        puts element1.value
           
        rescue Exception => e
        fail!(raise(ArgumentError.new('Failed Test - Name field doesnt appear!')))    
        puts e.message
        Process.exit(0)
      end
         
         element2 = wait_for_clickable_element(:name => "surname")   

      begin
        element2.displayed?
        element2.click
        element2.clear
        element2.send_keys surname
        puts element2.value
           
        rescue Exception => e
        fail!(raise(ArgumentError.new('Failed Test - Surname field doesnt appear!')))    
        puts e.message
        Process.exit(0)
      end
      
         element3 = wait_for_clickable_element(:name => "email")   
        
      begin
        element3.displayed?
        element3.click
        element3.clear
        element3.send_keys email
        puts element3.value
           
        rescue Exception => e
        fail!(raise(ArgumentError.new('Failed Test - Email field doesnt appear!')))    
        puts e.message
        Process.exit(0)
      end
      
         element4 = wait_for_clickable_element(:name => "redmineId")   

      begin
        element4.displayed?
        element4.click
        element4.clear
        element4.send_keys redmineid
        puts element4.value
           
        rescue Exception => e
        fail!(raise(ArgumentError.new('Failed Test - RedmineId field doesnt appear!')))    
        puts e.message
        Process.exit(0)
      end
        
         element5 = wait_for_clickable_element(:name => "phone")    
      
      begin
        element5.displayed?
        element5.click
        element5.clear
        element5.send_keys phone
        puts element5.value
           
        rescue Exception => e
        fail!(raise(ArgumentError.new('Failed Test - Phone field doesnt appear!')))    
        puts e.message
        Process.exit(0)
      end

        element6 = wait_for_clickable_element(:name => "skypeId")   

      begin
        element6.displayed?
        element6.click
        element6.clear
        element6.send_keys skypeid
        puts element6.value
           
        rescue Exception => e
        fail!(raise(ArgumentError.new('Failed Test - SkypeId field doesnt appear!')))    
        puts e.message
        Process.exit(0)
      end
        
end

When(/^click into Save button of Candidate's page$/) do
 
 sleep(3)
 $driver.find_element(:xpath, "//div[contains(@class, 'modal-footer')]/button[contains(@class, 'btn btn-primary')]").click
  
end

Then(/^the candidates data: "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)","([^"]*)" and "([^"]*)" are added to the system$/) do |name1, surname1, email1, redmineid1, phone1, skypeid1|

  $driver.manage.window.maximize
sleep(2)

   if $env== 'pha'
     
    $driver.find_element(:xpath, "//input").send_keys email1
    puts $driver.find_element(:xpath, "//input").value
     
     lista_td = $driver.find_elements(:xpath, "//html/body/div[2]/div/div/div/div[2]/div[2]/table/tbody/tr")
     
   else
     sleep(2)
     $element = wait_for_clickable_element(:xpath => "//html/body/div[2]/div/div/div/div[2]/div[1]/div/div[2]/input")
     $element.send_keys email1
     
     lista_td = $driver.find_elements(:xpath, "//table/tbody/tr")
     
   end
            
     $cont =  lista_td.count
     
     puts $cont
     
     cand_flag = 0
    
  for i in lista_td
                       
  if i.text.include?(name1) and i.text.include?(surname1) and  i.text.include?(email1) and i.text.include?(redmineid1) and i.text.include?(phone1) and i.text.include?(skypeid1)
               
         cand_flag = 1      
  end
  
  end

  if cand_flag == 1
      
       puts "The candidate was found!"
  else
        fail!(raise(ArgumentError.new('Failed Test - The candidate wasnt found!')))    
        puts e.message
        Process.exit(0)
    
  end
  
   $driver.find_element(:id, "account-menu").click
   $driver.find_element(:id, "logout").click
   sleep(2)
   #$driver.close
     
end