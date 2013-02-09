Feature: User Session

  Background:
    Given I am logged in

  Scenario: See as whom im currently logged in
    Given I have a project
    When I take a look at the project
    Then I should see my name in the top corner

  Scenario: Show the current issue you're working on
    Given I have a project, sprint and issue
    And I am currently working on the issue
    When I take a look at the project
    Then I should see the issue in my user session

