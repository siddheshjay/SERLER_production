Feature: Sort column for searching results
  As a registered user
  I want to be able to easily sort the displayed results of a search by any field I want
  So I can experiment with what is useful.

  Background:
    Given I'm logged in as a user on sort_column case
    Given I'm on search page on sort_column case
    Given There are 3 papers in DB on sort_column case

  @javascript
  Scenario: User type basic keywords to search on sort_column case
    When I type specific keywords and click search button on sort_column case
    And click the column which I want to sort
    Then The results can be sorted
