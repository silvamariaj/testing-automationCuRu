require_relative '../../page-object/division_nav_page'
require_relative '../../page-object/schedule_request'
require_relative '../../page-object/interview_profile_page'
require_relative '../../page-object/exercises_page'
require_relative '../../page-object/candidate_page'


Given(/^that I login into the InterviewApp as HR for check with "([^"]*)" and "([^"]*)"$/) do |userhr,password|
  
  $driver.navigate.to  $origin_url + '/#/login'
  sleep(1)
  $driver.manage.window.maximize
  $driver.find_element(:id, "username").send_keys userhr
  $driver.find_element(:id, "password").send_keys password
  #123qwe123
  $driver.find_element(:class, "btn-primary").click
     
   begin
  
   $driver.find_element(:class, "alert-success").displayed?
   puts("Login successful")
   $FLAG_TEST_SCH = 1
   $FLAG_TEST_EXE = 1
   $FLAG_TEST_CAN = 1
   
  rescue Exception => e
   if $driver.find_element(:class, "alert-danger").displayed?
   puts("Nothing to delete as HR")
   $FLAG_TEST_SCH = 0
   $FLAG_TEST_EXE = 0
   $FLAG_TEST_CAN = 0
   #$driver.close 
   end
   
   end

end

Given(/^enter into Schedule Request page for check$/) do
  
  if $FLAG_TEST_SCH == 1
  $driver.find_element(:id, "hr-menu").click
  $driver.find_element(:xpath, "//li[contains(@class, 'dropdown pointer ng-scope open')]/ul[contains(@class, 'dropdown-menu')]/li[2]/a/span[contains(@class, 'hidden-sm')]").click
  end
  
end


Given(/^that I login into the InterviewApp as IC for check with "([^"]*)" and "([^"]*)"$/) do |useric,password|
  
  $driver.navigate.to  $origin_url + '/#/login'
  sleep(1)
  $driver.manage.window.maximize
  $driver.find_element(:id, "username").send_keys useric
  $driver.find_element(:id, "password").send_keys password
  #123qwe123
  $driver.find_element(:class, "btn-primary").click
     
   begin
  
   $driver.find_element(:class, "alert-success").displayed?
   puts("Login successful")
   $FLAG_TEST_PRO = 1
   
  rescue Exception => e
   if $driver.find_element(:class, "alert-danger").displayed?
   puts("Nothing to delete as IC")
   $FLAG_TEST_PRO = 0
  # $driver.close
   end
   
   end
  
  
end

When(/^enter into Candidate's page for check$/) do

 if $FLAG_TEST_CAN == 1
  $driver.find_element(:id, "hr-menu").click
  $driver.find_element(:xpath, "//li[contains(@class, 'dropdown pointer ng-scope open')]/ul[contains(@class, 'dropdown-menu')]/li[1]/a").click
 end

end







#DELETING SCHEDULE

When(/^The user deletes the schedule for the "([^"]*)"$/) do |email|
  DivisionNavPage.click_human_resources('Schedule Request')
  ScheduleRequest.delete_schedule(email)
end

Then(/^The Schedule should be deleted "([^"]*)"$/) do |email|

  expect(ScheduleRequest.check_schedule(email)).to   eq(1) # Is counting the header
  DivisionNavPage.clean_cookie
end

#DELETING PROFILE

When(/^The user deletes the profile "([^"]*)"$/) do |profile|

  DivisionNavPage.click_coordinator('Interview Profile')
  InterviewProfilePage.delete_interview_profile(profile)
end

Then(/^The "([^"]*)" should be deleted the profile$/) do |profile|
  expect(InterviewProfilePage.check_interview_profile(profile)).to   eq(false)
  DivisionNavPage.clean_cookie
end

#DELETING CANDIDATE

When(/^The user deletes the candidate "([^"]*)"$/) do |email|
  DivisionNavPage.click_human_resources('Candidate')
  CandidatePage.delete_candidate(email)
end

Then(/^The "([^"]*)" should be deleted the candidate$/) do |email|
  expect(CandidatePage.check_candidate(email)).to   eq(false)
  DivisionNavPage.clean_cookie
end

#DELETING Exercises

When(/^The user deletes the exercises associated to "([^"]*)"$/) do |profile|
  DivisionNavPage.click_entities('Exercise')
  ExercisesPage.delete_exercises(profile)

end

Then(/^The exercises associated to "([^"]*)" should be deleted$/) do |profile|
  expect(ExercisesPage.check_exercises(profile)).to eq(false)
  DivisionNavPage.clean_cookie
end


