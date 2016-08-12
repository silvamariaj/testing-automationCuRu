Feature: As QA I want to automate the evaluator results flow logging in as Evaluator
so that I can repeat this automated flow on every new build
to ensure this process works properly and is continuously integrated.
As Evaluator:
1. Check email
2. Go to assigned exam results
3. Evaluate (put a score and feedback)
4. Submit the evaluation

Scenario Outline:
Given that I check my email for "<usereva>"
And I login into the InterviewApp as Evaluator with "<usereva>" and "<password>"
When see the results of the "<candidate>" with email "<email>" and score each answer
And add a feedback
And press the Submit button
Then the interview appears like EVALUATED and appears with the data previously added with "<usereva>" and "<password>"

Examples:
|candidate|email|usereva|password| 
|David Bowie|davidbow@yopmail.com|automationeva2|123qwe123|