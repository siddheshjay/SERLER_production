Feature: analyst longin
  As a registered analyst
  I want to be able to see new accepted articles
   So that I can edit evidence items
 
Background:
  Given I'm on analyst login page
  And Input analyst Email and password
  Scenario: Analyst login
  When I logn in as an analyst
  Then I can see Accepted Articles