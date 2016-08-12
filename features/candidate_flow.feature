Feature: Test candidate flow in the Staffing App.
  In order to a candidate can take the technical exam in the internew process
  Candidate should be able to get a link from his/her email account and follow the correct process

  Scenario Outline: Complete the Exam
    Given Candidate get the link to a exam related the position he/she is applying with email "<email>"
    When candidate clicks on the link, he/she should be able to see the main page of the exam
    Then clicks on the button to start the exam and he fills each question. Once he/she finishes the results are stored in the Staffing App

Examples:
|email|
|davidbow|