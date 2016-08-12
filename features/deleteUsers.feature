Feature: As DevOps I want to be able to delete users data 

Scenario Outline:
Given that I want to delete the data of the users
Then I delete the user HR "<userhr>"
And I delete the user IC "<useric>"
And I delete the user EVA "<usereva>"
And I delete the user EVA "<usereva2>"

Examples:
|userhr|useric|usereva|usereva2|
|automationhr2|automationic2|automationeva2|automationeva3|