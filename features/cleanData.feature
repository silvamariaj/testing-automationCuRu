Feature: As QA I want to be able to clean the data before run the tests
  

  Scenario Outline: Delete Schedule Request
    Given The user login to the app with the credentials "<user>" and "<password>"
    When The user deletes the schedule for the "<email>"
    Then The Schedule should be deleted "<email>"

    Examples:
      |user |password|email|
      |admin|admin  |davidbow@yopmail.com|
      |admin|admin  |alevine@yopmail.com |


  Scenario Outline: Delete Profile
    Given The user login to the app with the credentials "<user>" and "<password>"
    When  The user deletes the profile "<profile>"
    Then  The "<profile>" should be deleted the profile

    Examples:
      |user |password|profile |
      |admin|admin   |Profile OneOfEach2|



  Scenario Outline: Delete Candidate
    Given The user login to the app with the credentials "<user>" and "<password>"
    When  The user deletes the candidate "<candidate>"
    Then  The "<candidate>" should be deleted the candidate

    Examples:
      |user |password|candidate           |
      |admin|admin   |davidbow@yopmail.com|
      |admin|admin   |alevine@yopmail.com |

  Scenario Outline: Delete Exercises
     # Given The user login to the app with the credentials "<user>" and "<password>"
	Given that I login into the InterviewApp as HR for check with "<user>" and "<password>"
	Then I enter into Exercises page
    Then I delete the exercises for profile "<profile>"
   # When  The user deletes the exercises associated to "<profile>"
   # Then  The exercises associated to "<profile>" should be deleted

    Examples:
      |user |password|profile            |
      |admin|admin   |Profile OneOfEach2 |










