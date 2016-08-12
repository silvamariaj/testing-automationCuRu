Feature: As HR I want to be able to access into
Human Resources Menu to Schedule Interviews

@addSchedule
Scenario Outline:
Given that I login into the InterviewApp as HR with "<userhr>" and "<password>"
And enter into Schedule Request page
When HR press the New button
And enter the fields "<candidate>", "<profile>" and "<evaluator>"
Then the interview for the candidate "<candidate>" have status Scheduled


Examples:
|candidate|profile|evaluator|userhr|password|
|David Bowie|Profile OneOfEach2|Evaluator2 Automation role|automationhr2|123qwe123|

