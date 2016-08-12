Feature:Testing schedule a interview for a participant

  Background Outline:
    Given that I login into the InterviewApp as HR with "admin" and "admin"

  Scenario Outline: Adding Schedule
      Given enter into Schedule Request page
      And HR press the Create New Candidate button
      When enter the fields "<userhr>", "<profile>" and "<evaluator>"
      Then the interview for the candidate "<candidate>" have status Scheduled

    Examples:
    |candidate|profile|evaluator|user|password|
    |David Bowie|Profile OneOfEach2|Evaluator2 Automation role|automationhr2|123qwe123|