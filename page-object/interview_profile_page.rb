class InterviewProfilePage
  @waitfor = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
  @timeout = 3
  def self.delete_interview_profile(profile)
  
  $driver.find_element(:id,"searchInterviewProfile").click
  $driver.find_element(:id,"searchInterviewProfile").send_keys profile
  sleep(2)
  
    list_profile = $driver.find_elements(:css, 'div.table-responsive tr')
    list_profile.each do |person|
      if person.text.include? profile
        person.find_element(:css, 'button.btn.btn-danger.btn-sm').click
        @waitfor.until {$driver.find_element(:css, 'div.modal-content')}
        $driver.find_element(:css, 'button.btn.btn-danger').click
      end
    end
    sleep(@timeout)
  end


  def self.check_interview_profile(profile)
    list_profile = $driver.find_elements(:css, 'div.table-responsive tr')
    exist = false
    list_profile.each do |person|
      exist = true if person.text.include? profile
    end
    return exist
  end
end