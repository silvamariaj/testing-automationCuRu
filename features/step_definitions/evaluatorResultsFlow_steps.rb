
Given(/^that I check my email for "([^"]*)"$/) do |usereva|

$driver.manage.window.maximize
$driver.navigate.to 'http://www.yopmail.com/en/'
$driver.find_element(:id, 'login').send_keys usereva
$driver.find_element(:class, 'sbut').click
sleep(2)

$driver.switch_to.frame($driver.find_element(:xpath, "//*[@id='ifmail']"))

sleep(1)

begin
  
$driver.find_element(:xpath, "//*[@id='mailmillieu']/div[2]/table/tbody/tr/td/table/tbody/tr[3]/td/div/b/a").click
  
    rescue StandardError
        fail!(raise(ArgumentError.new('Failed Test - The email for evaluator wasnt found!')))    
        Process.exit(0)

end

link = $driver.find_element(:xpath, "//*[@id='mailmillieu']/div[2]/table/tbody/tr/td/table/tbody/tr[3]/td/div/b/a")
$href = link.attribute("href")

puts $href

  id_number = $href.split("/")
  $number_id_final = id_number[-2]

$driver.switch_to.window($driver.window_handles.last)

end


Given(/^I login into the InterviewApp as Evaluator with "([^"]*)" and "([^"]*)"$/) do |usereva,password|
  
  $driver.navigate.to  $origin_url + '/#/login'
  $driver.find_element(:id, "username").click
  $driver.find_element(:id, "username").send_keys usereva
  $driver.find_element(:id, "password").click
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

$driver.navigate.to $href
 
end


When(/^see the results of the "([^"]*)" with email "([^"]*)" and score each answer$/) do |candidate1, email1|
   
 #Find all the input score fields
 $candidato = candidate1
 $email_can = email1
 
 #element = wait_for_clickable_element(:name => "scoreExercise")
  $driver.manage.window.maximize
        sleep(2)
        element100 = wait_for_clickable_element(:id => "scoreExercise")
        los_inputs = $driver.find_elements(:tag_name, "input")
        puts los_inputs.count
 

  begin
        element100.displayed?
  
        los_inputs.each do |i|
        #For each field I enter score 20
        i.click
        i.clear
        i.send_keys "20"
    
        end
                  
        rescue Exception => e
        fail!(raise(ArgumentError.new('Failed Test - The scores are not showed!')))    
        puts e.message
        Process.exit(0)
  end
  
     
end

When(/^add a feedback$/) do
  
 # Add feedback
  $driver.find_element(:name, "evaluatorFeedback").click
  $driver.find_element(:name, "evaluatorFeedback").clear
  $driver.find_element(:name, "evaluatorFeedback").send_keys "Candidate Evaluated by Automated Evaluator"
  sleep(1)
end

When(/^press the Submit button$/) do
 $driver.find_element(:xpath, "//button[contains(@class, 'btn btn-primary')]").click
 puts("Save Button!")
 
   #Logs out
   $driver.find_element(:id, "account-menu").click
   $driver.find_element(:id, "logout").click
   
end

Then(/^the interview appears like EVALUATED and appears with the data previously added with "([^"]*)" and "([^"]*)"$/) do |usereva,password|
  
  #Logs in
 #$driver.navigate.to 'http://staffing-qa.nisumlatam.com:8080/#/login'
  $driver.navigate.to $origin_url + '/#/login'
  $driver.find_element(:id, "username").send_keys usereva
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
  
  
  #Go to Evaluators Results
$driver.manage.window.maximize
  $driver.find_element(:id, "evaluator-menu").click
  $driver.find_element(:xpath, "//*[@id='navbar-collapse']/ul/li[4]/ul/li/a/span[2]").click
  sleep(2)
        
   #Search the candidate
   $driver.find_element(:xpath, "//input").send_keys $email_can
    puts $driver.find_element(:xpath, "//input").value

   sleep(1)
   lista_td = $driver.find_elements(:xpath, "//html/body/div[2]/div/div/div/div[2]/div/div/table/tbody/tr")
  
   founded_feed = 0
   founded_scores = 0
   
     $cont =  lista_td.count
     
     puts $cont
    
  if $driver.find_element(:xpath, "//table/tbody/tr[" + $cont.to_s + "]/td[1]/a").text == $candidato and $driver.find_element(:xpath, "//table/tbody/tr[" + $cont.to_s + "]/td[3]").text == "EVALUATED" and  $driver.find_element(:xpath, "//table/tbody/tr[" + $cont.to_s + "]/td[7]/a").text == "see"
                    
     $driver.find_element(:xpath, "//table/tbody/tr[" + $cont.to_s + "]/td[7]/a").click
     sleep(1)
     
     begin
     
      $driver.find_element(:name, "evaluatorFeedback").displayed?
      
      $driver.find_element(:name, "evaluatorFeedback").click
      
      feed = $driver.find_element(:name, "evaluatorFeedback").value
       
     if feed == "Candidate Evaluated by Automated Evaluator"
        puts("Feedback is OK")
        founded_feed = 1
      else   
        founded_feed = 0
         puts("Feedback its different")
      
     end
     
       $driver.find_element(:name, "scoreExercise").displayed?
        inputs = $driver.find_elements(:name, "scoreExercise")
        
         inputs.each do |ii|
        #For each field I enter score 20
         ii.click
         score = ii.value
         puts score
         
           if score == "20"
             founded_scores = 1
             puts("Score is OK")
           else
             founded_scores = 0
               puts("Score its different")
             break
           end
         end 
   
     
        rescue Exception => e
          founded_scores = 0
          puts e.message
          Process.exit(0)
     
     end
          
    
   if founded_feed == 1 and founded_scores == 1
     puts "The evaluators results were recorded"
   else
        fail!(raise(ArgumentError.new('Failed Test - The evaluators results werent recorded!')))    
        puts e.message
        Process.exit(0)
   end
   
  end    
  
   $driver.find_element(:id, "account-menu").click
   $driver.find_element(:id, "logout").click
   sleep(1)
   $driver.close
   
end