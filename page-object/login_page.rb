class LoginPage

  def self.go_login_page
    $driver.get($origin_url + '/#/login')
  end

  def self.login(user, password)
    $driver.find_element(:id, "username").send_keys user
    $driver.find_element(:id, "password").send_keys password
    $driver.find_element(:class, "btn-primary").click
    sleep(5)
  end



end