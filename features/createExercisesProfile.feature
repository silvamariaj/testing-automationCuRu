Feature: As Interview Coordinator
I want to be able to create exercises and profile

Scenario Outline:
Given that I login into the InterviewApp as IC using "<user>" and "<password>"
And enter into Coordinator menu
Then I create a Written Exercise
And enter into Coordinator menu
And then I create a Logical Exercise
And enter into Coordinator menu
And then I create a Coding Exercise
And enter into Coordinator menu
And then I create a Multiple Choice Exercise
And then I create the Profile

Examples:
|user|password|
|automationic2|123qwe123|


