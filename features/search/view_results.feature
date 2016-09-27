Feature: View the results of a search
    As a registered user
    I want to be able to view the results of a search in a tabular format
    So that I can view a lot of information easily.

    Background:
        Given I'm logged in as a user at vr case
        And I'm on search page at vr case
        And There are 3 papers in DataBase at vr case

    Scenario: User type basic keywords to search and view
        When I type specific keywords and click search button at vr case
        Then I should get specific results and I can view them in a tabular format at vr case
