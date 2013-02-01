Feature: Session
  In order to keep track of the time
  In an orderly fasion
  Which forces you to actually do it on the spot
  I want to be able to start, stop and manage sessions

  Background:
    Given I am logged in

  Scenario: Start session on a issue by clicking continue
    Given I have a product, sprint and issue
    When I continue the issue
    Then I should have an active session
    And the continue button should now be a stop button
