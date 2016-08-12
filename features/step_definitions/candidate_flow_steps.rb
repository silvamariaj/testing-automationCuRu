Given(/^Candidate get the link to a exam related the position he\/she is applying with email "([^"]*)"$/) do |email|
  
  if $env == 'pha'
    $driver.manage.window.resize_to(1600, 900)
    $driver.manage.window.maximize
  end
 
  $driver.navigate.to 'http://www.yopmail.com/en/'
  sleep(1)
  $driver.find_element(:id, 'login').send_keys email
  $driver.find_element(:class, 'sbut').click

end

When(/^candidate clicks on the link, he\/she should be able to see the main page of the exam$/) do

if $env == 'pha'

  $driver.manage.window.resize_to(1600, 900)
  $driver.manage.window.maximize
  $driver.switch_to.frame($driver.find_element(:xpath, "//*[@id='ifmail']"))
  
  sleep(1)
  begin
  
  $driver.find_element(:xpath, ".//*[@id='mailmillieu']/div[2]/table/tbody/tr/td/table/tbody/tr[3]/td/div/b/a").click
  
    rescue StandardError
        fail!(raise(ArgumentError.new('Failed Test - The email for candidate wasnt found!')))    
        Process.exit(0)
  
  end
  
else
  
  $driver.switch_to.frame("ifmail")
  $driver.find_element(:css, '#mailmillieu a').click
end
  
  $driver.switch_to.window($driver.window_handles.last)

end

Then(/^clicks on the button to start the exam and he fills each question\. Once he\/she finishes the results are stored in the Staffing App$/) do
  
  if $env == 'pha'
    
  $driver.manage.window.resize_to(1600, 900)
 
  end
   
  $driver.find_element(:class, 'btn-primary').click
 
  radios = $driver.find_elements(:tag_name, "input")
  
 for i in radios
    
    if i.value == "4"
      
      i.click

    end
  
 end

 textareas = $driver.find_elements(:tag_name, "textarea")
  
  puts textareas.count

 for i in textareas
      
    if i.attribute("ng-model") == "exercise.answer.answer" 
      i.send_keys 'Answer for this question'
    else
      puts "hidden"
    end
     
 end
 
  $driver.find_element(:class, 'btn-success').click
  $driver.close

end


