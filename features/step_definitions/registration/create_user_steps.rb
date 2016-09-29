=begin
Feature: Regist new user
As a new user
I want a complete form to fill in my details
and I should receive a verification email about registration of my account and role.

    Scenario: Regist new user
Given I am not an registed user
When I visit registration page
Then I should be able to input my email
And I should be able to input my password
But My password should be minimum 6 characters
And I should be able to input my confirmation of password
But My confirmation of password should be same with the password
And I should be able to chose my gender
And I should be able to input my first name
And I should be able to input my middle name
And I should be able to input my last name
And I should be able to click "submit" button after filling all fields
=end

Given /^I am not an registed user$/ do
  visit user_session_path
end

When /^I visit registration page$/ do
  click_link "Sign up"
end

Then /^I should be able to input my email$/ do
  fill_in "Title", :with => "Caddyshack"
end

And /^I should be able to input my password$/ do
  pending
end

But /^My password should be minimum 6 characters$/ do
  pending
end

And /^I should be able to input my confirmation of password$/ do
  pending
end

But /^My confirmation of password should be same with the password$/ do
  pending
end

And /^I should be able to chose my gender$/ do
  pending
end

And /^I should be able to input my first name$/ do
  pending
end

And /^I should be able to input my middle name$/ do
  pending
end

And /^I should be able to input my last name$/ do
  pending
end

And /^I should be able to click "submit" button after filling all fields$/ do
  pending
end