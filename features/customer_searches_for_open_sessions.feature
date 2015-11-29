Feature: A Customer will search for available Sessions on a date and will get results

  Scenario: User visits the root page, searches for sessions on a date and is presented results
    When I go to the homepage and search for open sessions on a future date
    Then I should get redirected to the results