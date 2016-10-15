Feature: moderator longin
  As a registered moderator
  I want to be able to see new submitted articles
   So that I can accept articles
 
Background:
  Given I'm on moderator login page
  And Input moderator Email and password
  Scenario: moderator login
  When I logn in as an moderator
  Then I can see New Submitted Articles