Feature: Browse the repository by information
    As a registered user
    I want to be able to browse the repository by information like date or SE method
    So that I can familiarize myself with the data
    
    Background:
        Given I’m logged in as a user
        Given I’m on search page
        Given I search repository by information like date or SE method
        Given I get related repository
        Given There are 3 papers in DB
        
    Scenario: User type basic keywords to search and browse
        When I type information like date or SE method and click search button
        Then I should get related repository and I can browse them
