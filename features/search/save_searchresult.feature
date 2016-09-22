Feature: Save searches 
    As a registered user
    I want to be able to save the results of my search
    So that I can manipulate them or view them later
    
    Background:
        Given I’m logged in as a user
        Given I’m on search page
        Given There is ‘Save’ button on search page
        Given There are 3 papers in DB
        
    Scenario: User type basic keywords to save
        When I click the save button
        Then I should save the search into search list
