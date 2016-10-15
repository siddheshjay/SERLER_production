Feature: User longin
  As a registered user
  I want to be able to search for empirical evidence on different methods based on different constraints
  So that I can make informed decisions

  Background:
    Given I'm on login page
    And Input Email and password
  Scenario: User login
    When I click login button
    Then I can login
