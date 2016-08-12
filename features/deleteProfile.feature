Feature: As QA I want to be able to delete profile data 

Scenario Outline:
Given that I want to delete the data of the profile created with "<useric>" and "<password>"
And I enter into Interview Profile page and I search the profile "<profile>"
Then I delete the profile "<profile>"

Examples:
|profile|useric|password|
|Profile OneOfEach2|automationic2|123qwe123|


