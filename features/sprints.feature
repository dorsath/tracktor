Feature: Sprints
  Scenario: Show all the sprints that are active
    Given I have a product
    And it has an active sprint
    And an inactive sprint
    When I take a look at the product
    Then I should only see the active sprint

