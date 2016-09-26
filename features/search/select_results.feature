Feature: Select what columns are visible
    As a registered user
    I want to be able to  select what columns are visible in a displayed search
    So that I can experiment with what is visible

    Background:
        Given I’m logged in as a user
        Given I’m on search result page
        Given The result is shown according to different columns
        Given Each column has its own checklist
        Given There are 3 papers in DB

    Scenario: User type basic keywords to select
        When I click the checklist of one column
        Then I can make the column visible or unvisible
