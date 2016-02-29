Feature: A Customer will register a new account

  # As a Customer, I want to register for a new account so that I can schedule a Photographer

  Scenario Outline: Creating a new account
    Given I am not authenticated
    When I go to register a new Customer account
    And I fill in "customer[email]" with "<email>"
    And I fill in "customer[password]" with "<password>"
    And I fill in "customer[password_confirmation]" with "<password>"
    And I press "Sign up"
    Then I should see "Welcome! You have signed up successfully."

    Examples:
    | email           | password   |
    | testing@man.net | secretpass |
    | foo@bar.com     | fr33z312   |