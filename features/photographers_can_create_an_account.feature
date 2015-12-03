Feature: A Photographer will register a new account

    Scenario Outline: Creating a new account
        Given I am not authenticated
        When I go to register a new Photographer account
        And I fill in "photographer[email]" with "<email>"
        And I fill in "photographer[password]" with "<password>"
        And I fill in "photographer[password_confirmation]" with "<password>"
        And I press "Sign up"
        Then I should see "Welcome! You have signed up successfully."

        Examples:
        | email           | password   |
        | testing@man.net | secretpass |
        | foo@bar.com     | fr33z312   |