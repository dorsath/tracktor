Feature: Issues
  Background:
    Given I am logged in
    And I have a product

  Scenario: View the list of issues for a product
    Given I have an active sprint with a couple issues
    When I take a look at the product
    Then I should see the issues within the sprint

  @javascript
  Scenario: Move issue from backlog to a sprint
    Given it has an active sprint 
    And I have an issue
    And I take a look at the product
    When I drag the issue to the sprint
    Then the issue should be in the sprint
    
  @javascript
  Scenario: Create a new issue
    Given I take a look at the product
    When I press "a"
    Then I should see a new issue input
    When I fill in a name for the issue
    And I press enter
    Then there should be a new issue in the backlog

  Scenario: Get started on an issue by pressing the start button
    Given it has an active sprint
    And I have an issue
    And I take a look at the product
    When I start the issue by clicking on start
    Then the issue should be in progress
    And the time should be running for me on that issue

  @javascript
  Scenario: Rename an issue by double clicking its name
    Given it has an active sprint
    And I have an issue
    And I take a look at the product
    When I double click an issue
    Then it should change to an input
    When I change the name
    And I press enter
    Then the issue should be renamed
