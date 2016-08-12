
Given(/^that I login into the InterviewApp as HR with "([^"]*)" and "([^"]*)"$/) do |userhr,password|

  $driver.get($origin_url + '/#/login')
  $driver.manage.window.maximize
  $driver.find_element(:id, "username").send_keys userhr
  $driver.find_element(:id, "password").send_keys password
  #123qwe123
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
