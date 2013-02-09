Feature: Extensive Issue
  In order to give the user a more informative view of the issue
  As a user
  I should be able to toggle between views of the issues to show me more or less information about the issue

  Background:
    Given I am logged in

  @javascript
  Scenario: Toggle Issue extensiveness
    Given I have a project, sprint and issue
    And I take a look at the project
    When I click once on the issue
    Then it should be in extensive mode
    When I click on it again
    Then it should be in preview mode
