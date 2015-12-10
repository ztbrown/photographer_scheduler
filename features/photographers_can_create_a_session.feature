Feature: A Photographer will create a new session

  Scenario Outline: Creating a new session

    Given I am not authenticated
    When I go to register a new Photographer account
    And I fill in "photographer[email]" with "zack@gmail.com "
    And I fill in "photographer[password]" with "12345678"
    And I fill in "photographer[password_confirmation]" with "12345678"
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