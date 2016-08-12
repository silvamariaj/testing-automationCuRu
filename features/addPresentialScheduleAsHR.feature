Feature: As HR I want to be able to access into
  Human Resources Menu to Schedule Presential Interviews

  Scenario Outline:
    Given that I login into the InterviewApp as HR with "<userhr>" and "<password>"
    And enter into Schedule Request page
    When HR press the New button
    And enter fields "<datetime>", "<candidate>" and "<profile>"
    And enter "<evaluator1>" and "<evaluator2>"
    And add a "<comment>" and save the schedule
    Then the interview for the candidate "<candidate>" have status Scheduled


    Examples:
      |datetime|candidate|profile|evaluator1|evaluator2|comment|userhr|password|
      |20 Aug 2999 17:30|Adam Levine|Profile Gaspar|Evaluator2 Automation role|Evaluator2 Automation role|Test comment added|automationhr2|123qwe123|