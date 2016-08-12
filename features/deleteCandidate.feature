Feature: As QA I want to be able to delete the candidate that was created

Scenario Outline:
Given that I login into the InterviewApp as HR
And enter into Candidate's page
When I enter the "<email>" and I find the candidate
Then I delete the candidate

Examples:
|email|
|davidbow@yopmail.com|