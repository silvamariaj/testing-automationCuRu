class ScheduleRequest
  def self.delete_schedule(email)
    $driver.find_element(:tag_name , "input").click
    $driver.find_element(:tag_name , "input").send_keys email
    sleep(3)
    list_profile = $driver.find_elements(:css, 'div.table-responsive.ia-animate-filter button')
    if list_profile.length>1
      id_schedule = list_profile.at(0).attribute('href').split('/')[-1]
      RestClient.delete $origin_url + '/qa/interviewSchedules/' + id_schedule
    end

  end

  def self.check_schedule(email)
    $driver.navigate.refresh
    $driver.find_element(:tag_name , "input").clear
    $driver.find_element(:tag_name , "input").click
    $driver.find_element(:tag_name , "input").send_keys email
    sleep(5)
    return $driver.find_elements(:css , 'div.table-responsive.ia-animate-filter tr').length

  end

end



