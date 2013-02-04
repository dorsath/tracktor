Feature: Product
  Scenario: Creating a new project will automaticly create a backlog
    Given I am logged in
    When I create a project
    Then the project should have a backlog
