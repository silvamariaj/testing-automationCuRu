Feature: As a HR I want to be able to access to
Human Resources Menu to add candidates

@addcandidateAsHR
Scenario Outline:
Given that I login into the InterviewApp as HR with "<userhr>" and "<password>"
And enter into Candidate's page
When HR press the Create New Candidate button
And enter the fields "<name>", "<surname>", "<email>", "<redmineid>","<phone>" and "<skypeid>"
And click into Save button of Candidate's page
Then the candidates data: "<name>", "<surname>", "<email>", "<redmineid>","<phone>" and "<skypeid>" are added to the system

Examples:
|name|surname|email|redmineid|phone|skypeid|userhr|password|
|David|Bowie|davidbow@yopmail.com|2000|36363636|5000|automationhr2|123qwe123|
|Adam|Levine|alevine@yopmail.com|3000|38383838|8000|automationhr2|123qwe123|
