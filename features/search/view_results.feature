Feature: View the results of a search
    As a registered user
    I want to be able to view the results of a search in a tabular format
    So that I can view a lot of information easily.

    Background:
        Given I’m logged in as a user
        Given I’m on search page
        Given I search related information 
        Given I get results of the search
        Given I’m on search result page
        Given There are 3 papers in DB

    Scenario: User type basic keywords to search and view
        When I type specific keywords and click search button
        Then I should get specific results and I can view them in a tabular format