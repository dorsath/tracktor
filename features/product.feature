Feature: Product
  Scenario: Creating a new product will automaticly create a backlog
    Given I am logged in
    When I create a product
    Then the product should have a backlog
