Feature: Eidt New Eveidence Souces
   As a registered analyst
   I want to be able to eidt accepted articles
   So I can save evidence source
 
Background:
  Given I'm logged in as a admin analyst
  And There is one accepted article
  And I click Accepted Article link
Scenario: Edit articles
   When I click EDIT
   Then I will on edit page