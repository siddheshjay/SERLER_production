Feature: Save Search
  As a registered user
  I want to be able to save any searches I make so that I can easily run
  them again later to save time

  Background:
    Given I'm logged in as a user
    Given I'm on search page
    Given There are 3 papers in DB$

  Scenario: User can save and view search
    When I type specific keywords and click search button
    Then I should get specific results
    Then I click 'Search History' link and input 'Search name'
    Then When I I click 'Search History', I am on history page and can see the item in a tabular form
    Then I click 'Excute Search' and get the result