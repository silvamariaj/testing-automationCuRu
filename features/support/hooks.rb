require 'selenium-cucumber'

 
   case ENV['BROWSER']
     when 'phantomjs'
       begin
       $driver =  Selenium::WebDriver.for :phantomjs
       $env = 'pha'
       rescue Selenium::WebDriver::Error::WebDriverError => e
        sleep 0.3
        if _r = (_r || 0) + 1 and _r < 5
          retry
        else
          raise e
        end
       end
       
     when 'chrome'
       begin
       $driver =  Selenium::WebDriver.for :chrome
       $env = 'chro'
       rescue Selenium::WebDriver::Error::WebDriverError => e
        sleep 0.3
        if _r = (_r || 0) + 1 and _r < 5
          retry
        else
          raise e
        end
       end 
    
   end
   
   case ENV['ORIGIN']
     
     when 'QA'
       $origin_url = 'http://staffing-qa.nisumlatam.com:8080'
     when 'local'
       $origin_url = 'http://127.0.0.1:8080'

   end
     
  begin
 
 $FLAG_TEST_SCH = 0
 $FLAG_TEST_PRO = 0
 $FLAG_TEST_EXE = 0
 $FLAG_TEST_CAN = 0
 
 # $origin_url = 'http://staffing-qa.nisumlatam.com:8080'
 
 $driver.navigate.to  $origin_url + '/#/login'
 

       
target_size = Selenium::WebDriver::Dimension.new(1024, 768)
$driver.manage.window.size = target_size

# resize window
 $driver.manage.window.resize_to(1600, 900)
 $driver.manage.window.maximize

  rescue Exception => e
    puts e.message
    Process.exit(0)
  end
  
  $driver.manage.timeouts.implicit_wait = 30
  $wait = Selenium::WebDriver::Wait.new(:timeout => 15)

     
  After do |scenario|
    if scenario.failed?
      encoded_img = $driver.screenshot_as(:base64)
      embed("data:image/png;base64,#{encoded_img}",'image/png')
      $driver.close if $driver
    end

  
begin
  Selenium::WebDriver.for(:phantomjs).quit
  
rescue  Selenium::WebDriver::Error::WebDriverError
    Selenium::WebDriver.for(:phantomjs).quit
end
  
  end

  #Function for wait to an element
def wait_for_clickable_element(locator)
  $wait2 = Selenium::WebDriver::Wait.new(:timeout => 10)

  $elementx = $wait2.until { $driver.find_element(locator) }
  $wait2.until { $elementx.displayed? }
  $wait2.until { $elementx.enabled? }

  return $elementx
end

