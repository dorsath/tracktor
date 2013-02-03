Feature: Sprints
  Background:
    Given I am logged in

  Scenario: Show all the sprints that are active
    Given I have a product
    And it has an active sprint
    And an inactive sprint
    When I take a look at the product
    Then I should only see the active sprint

  @javascript
  Scenario: Add a new issue
    Given I have a product
    And I take a look at the product
    When I open the form by clicking on "Add sprint"
    Then I should see a form for the new sprint
    When I fill in the form's name
    And I press enter
    Then I should have a new sprint
