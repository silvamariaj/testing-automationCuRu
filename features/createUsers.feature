Feature: As QA I want to be able to prepare data to run the automated tests

Scenario Outline:
Given that I want to prepare the data to run the automated tests
Then I create the user HR "<userhr>" with password "<password>"
And I create the user IC "<useric>" with password "<password>"
And I create the user EVA "<usereva>" with name "<evaname>" and password "<password>"
And I create the user EVA "<usereva2>" with name "<evaname2>" and password "<password>"

Examples:
|userhr|useric|usereva|evaname|usereva2|evaname2|password|
|automationhr2|automationic2|automationeva2|Evaluator2|automationeva3|Evaluator3|123qwe123|

