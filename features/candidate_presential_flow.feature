Feature: Test presential candidate flow in the Staffing App.
  In order to a candidate can take the technical exam in the presential interview process
  HR user should be able to open the link from staffing-app and follow the correct process

  Scenario Outline: Complete Presential Exam
    Given that I login into the InterviewApp as HR with "<userhr>" and "<password>"
    And enter into Schedule Request page
    When HR search the "<candidate>" schedule, and clicks the link in order to display main page of exam
    Then clicks on the button to start the exam and he fills each question. Once he/she finishes the results are stored in the Staffing App

Examples:
|userhr|password|candidate|
|automationhr2|123qwe123|Adam Levine|