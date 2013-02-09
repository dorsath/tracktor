Feature: User Session

  Scenario: See as whom im currently logged in
    Given I am logged in
    And I have a project
    When I take a look at the project
    Then I should see my name in the top corner

