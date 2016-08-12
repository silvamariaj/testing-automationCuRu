class DivisionNavPage
  @timeout = 3

####################
#First Options in the top nav bar
####################
  def self.click_nav_home
    $driver.find_element(:link_text, "Home").click
    sleep(@timeout)
  end
####################
#Second option in the top nav bar
####################

  def self.click_human_resources(event)
    #Clicking HR in the top nav bar to extend the drop down menu
    $driver.find_element(:id, "hr-menu").click
    #Clicking option by param
    $driver.find_elements(:css, "ul.dropdown-menu span").each do |option|
      option.click if option.text == event
    end
    sleep(@timeout)
  end


####################
#Third option in the top nav bar
####################

  def self.click_coordinator(event)
    #Clicking Coordinator in the top nav bar to extend the drop down menu
    $driver.find_elements(:css, 'a#coordinator-menu.dropdown-toggle').last.click
    #Clicking option by param
    $driver.find_elements(:css, 'ul.dropdown-menu span').each do |option|
      option.click if option.text == event
    end
    sleep(@timeout)
  end

  def self.click_nav_exercises(var)
    #Clicking the drop down menu
    $driver.find_element(:id, 'coordinator-menu').click

    #Doing mouse over in exercises to get the submenu
    opt = $driver.find_element(:class, 'dropdown-submenu')
    $driver.mouse.move_to opt
    sleep(10)

    #Clicking one options of the submenu
    subdrop = $driver.find_elements(:css, 'li.dropdown-submenu a')
    subdrop.each do |option|
      option.click if option.text == var
    end
    sleep(@timeout)
  end


####################
#Four option in the top nav bar
####################

  def self.click_nav_evaluator_results_ev
    #Clicking the option in the drop down
    $driver.find_element(:id, 'evaluator-menu').click
    $driver.find_elements(:css, 'ul.dropdown-menu span').each do |option|
      option.click if option.text == 'Evaluator Results'
    end
    sleep(@timeout)
  end


####################
#option five in the top nav bar
####################

  def self.click_entities(event)
    #Clicking Coordinator in the top nav bar to extend the drop down menu
    $driver.find_element(:css, 'li.dropdown:nth-child(5) > a:nth-child(1)').click
    #Clicking option by param

    $driver.find_elements(:css, 'ul.dropdown-menu span').each do |option|
      option.click if option.text == event

    end
    sleep(@timeout)
  end


####################
#option six in the top nav bar
####################

  def self.click_account(event)
    #Clicking Coordinator in the top nav bar to extend the drop down menu
    $driver.find_element(:id, 'account-menu').click
    #Clicking option by param

    $driver.find_elements(:css, 'ul.dropdown-menu span').each do |option|
      option.click if option.text == event

    end
    sleep(@timeout)
  end

  def self.clean_cookie
    $driver.manage.delete_all_cookies
    $driver.navigate.refresh
    sleep(@timeout)
  end
end

