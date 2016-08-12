Given(/^that I login into the InterviewApp as IC using "([^"]*)" and "([^"]*)"$/) do |user,password|
 
  $driver.manage.window.maximize
  $driver.find_element(:id, "username").send_keys user
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

Given(/^enter into Coordinator menu$/) do
 
     $driver.manage.window.maximize
     element = $driver.find_element(:xpath, "//a[@id='coordinator-menu']/span/span[contains(@class, 'hidden-sm')]")

     $driver.action.move_to(element).click.perform
     $driver.action.move_to(element).send_keys(:arrow_down).perform
     $driver.action.move_to(element).send_keys(:arrow_down).perform
     $driver.action.move_to(element).send_keys(:arrow_down).perform 
     
     puts "Entering into Coordinator Menu"
             
end

Then(/^I create a Written Exercise$/) do
sleep(1)  
    puts "Entering into Exercises"
    element = $driver.find_element(:class, "glyphicon-paperclip")
    $driver.action.move_to(element).perform
   
    puts "Entering into Written Menu" 
    element = $driver.find_element(:xpath, "//*[@id='navbar-collapse']/ul/li[3]/ul/li[3]/ul/li[1]/a")
    
    link = $driver.find_element(:xpath, "//*[@id='navbar-collapse']/ul/li[3]/ul/li[3]/ul/li[1]/a")
    href = link.attribute("href")
     
   $driver.navigate.to href

   sleep(2)
       
    element = wait_for_clickable_element(:id => "field_question")
     
     begin
        element.click
        element.clear
        element.send_keys "Written Exercise Profile OneOfEach2"
             
        rescue Exception => e
        fail!(raise(ArgumentError.new('Failed Test - Field Question doesnt appear!')))    
        puts e.message
        Process.exit(0)
     end
    
    $driver.find_element(:xpath,"//textarea").click
    $driver.find_element(:xpath,"//textarea").clear
    $driver.find_element(:xpath,"//textarea").send_keys "Please answer the question: 2-2=?"
    sleep(1)
    $driver.find_element(:xpath,"//input[@id='field_expectedAnswer']").click
    $driver.find_element(:xpath,"//input[@id='field_expectedAnswer']").clear
    $driver.find_element(:xpath,"//input[@id='field_expectedAnswer']").send_keys "0"
    sleep(1)
    $driver.find_element(:xpath,"//input[@id='field_score']").click
    $driver.find_element(:xpath,"//input[@id='field_score']").clear
    $driver.find_element(:xpath,"//input[@id='field_score']").send_keys "90"
    sleep(1)
    $driver.find_element(:xpath,"//input[@id='field_time']").click
    $driver.find_element(:xpath,"//input[@id='field_time']").clear
    $driver.find_element(:xpath,"//input[@id='field_time']").send_keys "10"
    sleep(1)
    $driver.find_element(:xpath,"//*[@id='field_complexity']/option[3]").click
    sleep(1)
    $driver.find_element(:class, "btn-primary").click
   
end

Then(/^then I create a Logical Exercise$/) do
    puts "Entering into Logical Menu"
    sleep(1)  
  
    element = $driver.find_element(:xpath, "//*[@id='navbar-collapse']/ul/li[3]/ul/li[3]/a")
    $driver.action.move_to(element).perform

    element = $driver.find_element(:xpath, "//*[@id='navbar-collapse']/ul/li[3]/ul/li[3]/ul/li[2]/a")
  # element.click
   $driver.action.move_to(element).perform
 
   link = $driver.find_element(:xpath, "//*[@id='navbar-collapse']/ul/li[3]/ul/li[3]/ul/li[2]/a")
    href = link.attribute("href")
    
   $driver.navigate.to  href
   
  sleep(2)

   element = wait_for_clickable_element(:id => "field_question")
   element.displayed?
     
     begin
        element.click
        element.clear
        element.send_keys "Logical Exercise Profile OneOfEach2"
             
        rescue Exception => e
        fail!(raise(ArgumentError.new('Failed Test - Field Question doesnt appear!')))    
        puts e.message
        Process.exit(0)
     end
    
    $driver.find_element(:xpath,"//textarea").click
    $driver.find_element(:xpath,"//textarea").clear
    $driver.find_element(:xpath,"//textarea").send_keys "Please answer the question: 2-2=?"
    sleep(1)
    $driver.find_element(:xpath,"//input[@id='field_expectedAnswer']").click
    $driver.find_element(:xpath,"//input[@id='field_expectedAnswer']").clear
    $driver.find_element(:xpath,"//input[@id='field_expectedAnswer']").send_keys "0"
    sleep(1)
    $driver.find_element(:xpath,"//input[@id='field_score']").click
    $driver.find_element(:xpath,"//input[@id='field_score']").clear
    $driver.find_element(:xpath,"//input[@id='field_score']").send_keys "90"
    sleep(1)
    $driver.find_element(:xpath,"//input[@id='field_time']").click
    $driver.find_element(:xpath,"//input[@id='field_time']").clear
    $driver.find_element(:xpath,"//input[@id='field_time']").send_keys "10"
    sleep(1)
    $driver.find_element(:xpath,"//*[@id='field_complexity']/option[3]").click
    sleep(1)  
    $driver.find_element(:class, "btn-primary").click
  
end

Then(/^then I create a Coding Exercise$/) do
   
   puts "Entering into Coding Menu"
   
   sleep(1)  
   element = $driver.find_element(:class, "glyphicon-paperclip")
   $driver.action.move_to(element).perform
   element = $driver.find_element(:xpath, "//*[@id='navbar-collapse']/ul/li[3]/ul/li[3]/ul/li[3]/a")

  $driver.action.move_to(element).perform

   link = $driver.find_element(:xpath, "//*[@id='navbar-collapse']/ul/li[3]/ul/li[3]/ul/li[3]/a")
    href = link.attribute("href")
   $driver.navigate.to href
   
	sleep(2)
 
     begin  
        element = wait_for_clickable_element(:id => "field_question")
        element.displayed?
     
        element.click
        element.clear
        element.send_keys "Coding Exercise Profile OneOfEach2"
             
        rescue Exception => e
        fail!(raise(ArgumentError.new('Failed Test - Field Question doesnt appear!')))    
        puts e.message
        Process.exit(0)
     end

    $driver.find_element(:xpath,"//textarea").click
    $driver.find_element(:xpath,"//textarea").clear
    $driver.find_element(:xpath,"//textarea").send_keys "Write a code to show into screen 'Hola Mundo' in Java"
    sleep(1)
    $driver.find_element(:xpath,"//div[contains(@class, 'form-group')]/input[contains(@name, 'classname')]").click
    $driver.find_element(:xpath,"//div[contains(@class, 'form-group')]/input[contains(@name, 'classname')]").clear
    $driver.find_element(:xpath,"//div[contains(@class, 'form-group')]/input[contains(@name, 'classname')]").send_keys "Class"
    sleep(1)
    $driver.find_element(:xpath,"//*[@name='complexity']/option[2]").click
    sleep(1)
    $driver.find_element(:xpath,"/html/body/div[2]/div/div/form/div[4]/div[2]/input").click
    $driver.find_element(:xpath,"/html/body/div[2]/div/div/form/div[4]/div[2]/input").clear
    $driver.find_element(:xpath,"/html/body/div[2]/div/div/form/div[4]/div[2]/input").send_keys "Method"
    sleep(1)
    $driver.find_element(:id,"field_input").click
    $driver.find_element(:id,"field_input").clear
    $driver.find_element(:id,"field_input").send_keys "Input"
    sleep(1)
    $driver.find_element(:id,"field_output").click
    $driver.find_element(:id,"field_output").clear
    $driver.find_element(:id,"field_output").send_keys "Output"
    sleep(1)
    $driver.find_element(:xpath,"//input[@id='field_score']").click
    $driver.find_element(:xpath,"//input[@id='field_score']").clear
    $driver.find_element(:xpath,"//input[@id='field_score']").send_keys "90"
    sleep(1)
    $driver.find_element(:xpath,"//input[@id='field_time']").click
    $driver.find_element(:xpath,"//input[@id='field_time']").clear
    $driver.find_element(:xpath,"//input[@id='field_time']").send_keys "10"
    sleep(1)
    $driver.find_element(:xpath,"//*[@id='field_complexity']/option[3]").click
    sleep(1)
    $driver.find_element(:class, "btn-primary").click
    
 
end

Then(/^then I create a Multiple Choice Exercise$/) do
    puts "Entering into Multiple Choice Menu"

sleep(1)  
     element = $driver.find_element(:xpath, "//*[@id='navbar-collapse']/ul/li[3]/ul/li[3]/a")
     $driver.action.move_to(element).perform
    element = $driver.find_element(:xpath, "//*[@id='navbar-collapse']/ul/li[3]/ul/li[3]/ul/li[4]/a")
    $driver.action.move_to(element).perform
    #element.click
    link = $driver.find_element(:xpath, "//*[@id='navbar-collapse']/ul/li[3]/ul/li[3]/ul/li[4]/a")
    href = link.attribute("href")     
    $driver.navigate.to href
     sleep(2)
    
 
    element = wait_for_clickable_element(:id => "field_question")
    element.displayed?
             
     begin

        element.click
        element.clear
        element.send_keys "Multiple Choice Exercise Profile OneOfEach2"
             
        rescue Exception => e
        fail!(raise(ArgumentError.new('Failed Test - Field Question doesnt appear!')))    
        puts e.message
        Process.exit(0)
     end
     
    $driver.find_element(:xpath,"//textarea[@id='field_description']").click
    $driver.find_element(:xpath,"//textarea[@id='field_description']").clear
    $driver.find_element(:xpath,"//textarea[@id='field_description']").send_keys "Please select the answer for: 2-2=?"
    sleep(1)
    $driver.find_element(:xpath,"//input[@name='expectedAnswer']").click
    $driver.find_element(:xpath,"//input[@name='expectedAnswer']").clear
    $driver.find_element(:xpath,"//input[@name='expectedAnswer']").send_keys "0"
    sleep(1)
    $driver.find_element(:xpath,"/html/body/div[2]/div/div/form/ul/li[1]/div/div[2]/span/input").click
    $driver.find_element(:xpath,"/html/body/div[2]/div/div/form/ul/li[1]/div/div[2]/span/input").clear
    $driver.find_element(:xpath,"/html/body/div[2]/div/div/form/ul/li[1]/div/div[2]/span/input").send_keys "0"
    sleep(1)
    $driver.find_element(:xpath,"//a[contains(@class, 'btn btn-info btn-sl')]").click
    sleep(1)
    $driver.find_element(:xpath,"/html/body/div[2]/div/div/form/ul/li[2]/div/div[2]/span/input").click
    $driver.find_element(:xpath,"/html/body/div[2]/div/div/form/ul/li[2]/div/div[2]/span/input").clear
    $driver.find_element(:xpath,"/html/body/div[2]/div/div/form/ul/li[2]/div/div[2]/span/input").send_keys "4"
    sleep(1)
    $driver.find_element(:xpath,"//input[@id='field_score']").click
    $driver.find_element(:xpath,"//input[@id='field_score']").clear
    $driver.find_element(:xpath,"//input[@id='field_score']").send_keys "90"
    sleep(1)
    $driver.find_element(:xpath,"//input[@id='field_time']").click
    $driver.find_element(:xpath,"//input[@id='field_time']").clear
    $driver.find_element(:xpath,"//input[@id='field_time']").send_keys "10"
    $driver.find_element(:xpath,"//*[@name='complexity']/option[3]").click
    sleep(1)
    
    $driver.find_element(:class, "btn-primary").click
    

end

Then(/^then I create the Profile$/) do

 $driver.manage.window.maximize
 
      element = $driver.find_element(:xpath, "//a[@id='coordinator-menu']/span/span[contains(@class, 'hidden-sm')]")
      $driver.action.move_to(element).click.perform
      
      $driver.action.move_to(element).send_keys(:tab).perform
           $driver.action.move_to(element).send_keys(:tab).perform
                $driver.action.move_to(element).send_keys(:tab).perform
                     $driver.action.move_to(element).send_keys(:enter).perform
                      
     
     sleep(1)


 $driver.find_element(:xpath, "html/body/div[2]/div/div/div[1]/div/div/button").click

 $driver.find_element(:id, "field_profileName").click
 $driver.find_element(:id, "field_profileName").send_keys "Profile OneOfEach2"

 $driver.find_element(:id, "field_category").click
 $driver.find_element(:xpath, ".//*[@id='field_category']/option[2]").click
 sleep(1)
 $driver.find_element(:id, "field_level").click
 $driver.find_element(:xpath, ".//*[@id='field_level']/option[2]").click
 sleep(1)

 $driver.find_element(:id, "searchExercise").click
 $driver.find_element(:id, "searchExercise").send_keys "Profile OneOfEach2"
 sleep(2)
 
 num = 0
 
 while num < 4
 
 selec = $driver.find_elements(:class, "glyphicon-plus")
 sleep(2)

 for i in selec
         
     i.click
     sleep(1)
	 break
  
 end
 
 num = num + 1
 
 end
 
 
 sleep(2)
 
$driver.find_element(:class, "glyphicon-save").click

end

