class CandidatePage
  @waitfor = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
  @timeout = 3
  def self.delete_candidate(email)
    find_bar = $driver.find_element(:tag_name, 'input')
    find_bar.click
    find_bar.send_keys email
    sleep(@timeout)
    list_profile = $driver.find_elements(:css, 'table.jh-table.table.table-striped tr')

    if list_profile.length>1
      $driver.find_element(:css, 'button.btn.btn-danger.btn-sm').click
      @waitfor.until {$driver.find_element(:css, 'div.modal-content')}
      $driver.find_element(:css, 'button.btn.btn-danger').click
    end
    sleep(@timeout)
  end
  def self.check_candidate(email)
    $driver.navigate.refresh
    sleep(3)
    find_bar = $driver.find_element(:tag_name, 'input')
    find_bar.click
    find_bar.send_keys email
    list_profile = $driver.find_elements(:css, 'table.jh-table.table.table-striped tr').count - 1
    if list_profile > 0
      return true
    else
      return false
    end

  end
end