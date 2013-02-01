Feature: Issues
  Background:
    Given I am logged in

  Scenario: View the list of issues for a product
    Given I have a product
    And I have an active sprint with a couple issues
    When I take a look at the product
    Then I should see the issues within the sprint
