Feature: Eidt New Eveidence Souces
   As a registered analyst
   I want to be able to eidt accepted articles
   So I can save evidence source
 
Background:
  Given I'm logged in as a admin analyst
  And I click ACCEPTED Article
Scenario: add new evidence item
   When I click Create New
   Then we will on NEW EVIDENCE ITEM pagea