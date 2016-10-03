Feature: Show and hide the columns of searching results by user
  As a registered user
  I want to be able to select what columns are visible in a displayed search
  So I can experiment with what is visible

  Background:
    Given I'm logged in as a user on select_column case
    And I'm on search page on select_column case
    And There are 3 papers in DB on select_column case
    And I type specific keywords and click search button on select_column case

  @javascript
  Scenario: User type basic keywords to search
    When I canceled a checkbox of a column
    Then The column hides
