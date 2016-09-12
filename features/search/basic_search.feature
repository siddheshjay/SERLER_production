Feature: Search For Empirical Evidence
  As a registered user
  I want to be able to search for empirical evidence on different methods based on different constraints
  So that I can make informed decisions

  Background:
    Given I'm logged in as a user
    Given I'm on search page

  Scenario: User type basic keywords to search
    When I type specific keywords and click search button
    Then I should get specific results
