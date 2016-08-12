require_relative '../../../page-object/division_nav_page'
require_relative '../../../page-object/login_page'
require_relative '../../../page-object/schedule_request'

Given(/^The user login to the app with the credentials "([^"]*)" and "([^"]*)"$/) do |user, password|
  LoginPage.go_login_page
  sleep(5)
  LoginPage.login(user, password)


end

When(/^The user is already sign in "([^"]*)"$/) do |email|
  DivisionNavPage.click_human_resources('Schedule Request')
  ScheduleRequest.delete_schedule(email)
end

Then(/^The user should only have permission associated to his "([^"]*)"$/) do |role|
  DivisionNavPage.clean_cookie
end