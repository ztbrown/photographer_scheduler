Feature: A Photographer will create a new session

  # As a Photographer, I want to be able to login to my account and create a new session so that I can begin to
  # schedule my empty dates and make money.

  Scenario Outline: Creating a new session

    Given I am not authenticated
    When I go to register a new Photographer account
    And I fill in "user[email]" with "zack@gmail.com "
    And I fill in "user[password]" with "12345678"
    And I fill in "user[password_confirmation]" with "12345678"
    And I press "Sign up"
    When I go to create a new Session
    And I fill in "wedding_date" with "<date>"
    And I fill in "rate" with "<rate>"
    And I press "Create"
    Then I should see "New session added successfully."

    Examples:
      | date           | rate       |
      | 2016-6-1       | 7500       |
      | 2016-12-2      | 2300       |
