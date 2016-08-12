Feature: Login to the staffing app with different roles

  Scenario Outline: Login with different roles
    Given The user login to the app with the credentials "<user>" and "<password>"
    When  The user is already sign in "<email>"
    Then  The user should only have permission associated to his "<role>"

    Examples:
      |user       |password     |role     |email          |
      |admin      |admin        |admin    |sabrine.serikawa@gmail.com                             |
