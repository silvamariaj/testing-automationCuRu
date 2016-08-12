Feature: As QA I want to delete the exercises that were created

Scenario Outline:
Given that I want to delete the exercises created with "<userhr>" and "<password>"
And I enter into Exercises page
Then I delete the exercises for profile "<profile>"

Examples:
|profile|userhr|password|
|Profile OneOfEach2|automationhr2|123qwe123|