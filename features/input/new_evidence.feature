Feature: submit new evidence source
  As a registered user
  I want to be able to access to new evidence source page
  So I can submit evidence source

Background:
  Given I'm logged in as a admin user
  And I click New Article link
@javascript
Scenario: add new evidence
  When I type specific Title year and click submit
  Then we will on the list of submission pagea
