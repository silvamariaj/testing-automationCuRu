Feature: As QA I want to be able to erase the interview schedule and its relations

Scenario Outline:
Given that I login into the InterviewApp as HR
Then enter into Schedule Request page
And I get the Schedule Id using the "<name>", "<email>" and "<profile>"
Then I delete the Schedule


Examples:
|name|email|profile|
|David Bowie|davidbow@yopmail.com|Profile OneOfEach2|
