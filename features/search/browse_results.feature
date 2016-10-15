Feature: Browse the repository by information
  As a registered user
  I want to be able to browse the repository by information like date or SE method
  So that I can familiarize myself with the data

  Background:
    Given There are 3 papers in DB

  Scenario: User type basic keywords to search and browse
    When I visit browse page
    Then I can see 3 papers on page
