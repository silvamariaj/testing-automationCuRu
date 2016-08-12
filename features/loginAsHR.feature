Feature: To login into InterviewApp as HR
As an user of the system I want to login into InterviewsApp
to perform different task according to my profile

@loginHR
Scenario Outline::
Given that I login into the InterviewApp as HR with "<userhr>" and "<password>"

Examples:
|userhr|password|
|automationhr2|123qwe123|