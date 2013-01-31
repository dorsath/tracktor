Feature: Issues
  Scenario: View the list of issues for a product
    Given I have a product with a couple issues
    When I take a look at that product
    Then I should see the issues
