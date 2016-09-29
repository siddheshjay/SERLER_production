Feature: Regist new user
  As a new user
  I want a complete form to fill in my details
  and I should receive a verification email about registration of my account and role.

  Background:
    Given I am not an registed user
    When I visit registration page
    And I should be able to input my email
    And I should be able to input my password
    And I should be able to input my confirmation of password
    And I should be able to choose my gender
    And I should be able to input my first name
    And I should be able to input my middle name
    And I should be able to input my last name

  Scenario: password is less than 6 characters
    When My password is less 6 characters
    And I should be able to click "submit" button after filling all fields
    Then The page should remind me "Password is too short minimum is 6 characters"

  Scenario: passwords inputted twice are different
    When My confirmation of password is different from password inputted first time
    And I should be able to click "submit" button after filling all fields
    Then The page should remind me "Password confirmation doesn't match Password"

  Scenario: Email is empty
    When I did not input email
    And I should be able to click "submit" button after filling all fields
    Then The page should remind me "Email can't be blank"

  Scenario: First name is empty
    When I did not input first name
    And I should be able to click "submit" button after filling all fields
    Then The page should remind me "First name can't be blank"

  Scenario: Middle name is empty
    When I did not input middle name
    And I should be able to click "submit" button after filling all fields
    Then The page should remind me "Middle name can't be blank"

  Scenario: Last name is empty
    When I did not input last name
    And I should be able to click "submit" button after filling all fields
    Then The page should remind me "Last name can't be blank"

  Scenario: Register successfully
    When I should be able to click "submit" button after filling all fields
    Then A link of Sign out is displayed