Feature: Accept articles
   As a registered moderator
   I want to be able to accept articles
   So the articles can be accepted to the analyst
 
Background:
  Given I'm logged in as a admin moderator
  And I click New Submitted Article
Scenario: accept articles
   When I click ACCEPT
   Then we will See please refresh page