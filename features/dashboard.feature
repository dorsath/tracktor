Feature: Dashboard
  In order to give all the info he wants
  I want to be able to see my projects and its progress

  Background:
    Given I am logged in

  Scenario: Show the dashboard with a project with its and his specific info on it
    Given I have a project
    And the project has seen some work
    When I visit my dashboard
    Then I should see the project
    And I should see the total time spent on it
    And I should see the total time I spent on it

