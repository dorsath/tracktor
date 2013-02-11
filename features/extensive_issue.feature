Feature: Extensive Issue
  In order to give the user a more informative view of the issue
  As a user
  I should be able to toggle between views of the issues to show me more or less information about the issue

  Background:
    Given I am logged in
    And I have a project, sprint and issue
    And I take a look at the project

  @javascript
  Scenario: Toggle Issue extensiveness
    When I click once on the issue
    Then it should be in extensive mode
    When I click on it again
    Then it should be in preview mode

  @javascript
  Scenario: Show issue info when in extensive mode
    When I click once on the issue
    Then I should see the user who created it
    And I should see when it was created
    And I should see how much time there was spent on it
