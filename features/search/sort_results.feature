Feature: Sort the displayed results of a search
    As a registered user
    I want to be able to easily sort the displayed results of a search by any field I want
    So that I can experiment with what is useful

    Background:
        Given I'm logged in as a user at sort test
        Given I'm on search result page at sort test
        Given There are several fields of results can be chose and the results can be sorted by these fields
        Given Each field has its own checklist
        Given There are 3 papers in DB

    Scenario: User type basic keywords to sort
        When I click the checklist of one field
        Then I should get related results according to this field
