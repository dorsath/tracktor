Feature: Issues
  Background:
    Given I am logged in

  Scenario: View the list of issues for a product
    Given I have a product
    And I have an active sprint with a couple issues
    When I take a look at the product
    Then I should see the issues within the sprint

  @javascript
  Scenario: Move issue from backlog to a sprint
    Given I have a product
    And it has an active sprint 
    And I have an issue
    And I take a look at the product
    When I drag the issue to the sprint
    Then the issue should be in the sprint
    
    

