# Feature: Regist new user
# As a new user
# I want a complete form to fill in my details
# and I should receive a verification email about registration of my account and role.
#
#     Background:
#     Given I am not an registed user
# When I visit registration page
# And I should be able to input my email
# And I should be able to input my password
# And I should be able to input my confirmation of password
# And I should be able to choose my gender
# And I should be able to input my first name
# And I should be able to input my middle name
# And I should be able to input my last name

Given /^I am not an registed user$/ do
  visit user_session_path
end

When /^I visit registration page$/ do
  click_link "Sign up"
end

Then /^I should be able to input my email$/ do
  fill_in "user_email", :with => "123@123.com"
end

And /^I should be able to input my password$/ do
  fill_in "user_password", :with => "123123"
end

But /^My password should be minimum 6 characters$/ do
  find_field("user_password").value.length <= 6
end

And /^I should be able to input my confirmation of password$/ do
  fill_in "user_password_confirmation", :with => "123123"
end

But /^My confirmation of password should be same with the password$/ do
  find_field("user_password").value.should ==  find_field("user_password_confirmation").value
end

And /^I should be able to choose my gender$/ do
  choose "user_gender_female"
end

And /^I should be able to input my first name$/ do
  fill_in "user_first_name", :with => "FirstName"
end

And /^I should be able to input my middle name$/ do
  fill_in "user_middle_name", :with => "MiddleName"
end

And /^I should be able to input my last name$/ do
  fill_in "user_last_name", :with => "lastName"
end

And /^I should be able to click "submit" button after filling all fields$/ do
  click_button "Sign up"
end

# Scenario: password is less than 6 characters
# When My password is less 6 characters
# And I should be able to click "submit" button after filling all fields
# Then The page should remind me "Password is too short (minimum is 6 characters)"

When /^My password is less 6 characters$/ do
  fill_in "user_password", :with => "1"
end

Then /^The page should remind me "Password is too short minimum is 6 characters"$/ do
  page.has_content?("Password is too short (minimum is 6 characters)")
end

# Scenario: passwords inputted twice are different
# When My confirmation of password is different from password inputted first time
# And I should be able to click "submit" button after filling all fields
# Then The page should remind me "Password confirmation doesn't match Password"

When /^My confirmation of password is different from password inputted first time$/ do
  fill_in "user_password_confirmation", :with => "111111"
end

Then /^The page should remind me "Password confirmation doesn't match Password"$/ do
  page.has_content?("Password confirmation doesn't match Password")
end

# Scenario: Email is empty
# When I did not input email
# And I should be able to click "submit" button after filling all fields
# Then The page should remind me "Email can't be blank"

When /^I did not input email$/ do
  fill_in "user_password_confirmation", :with => ""
end

Then /^The page should remind me "Email can't be blank"$/ do
  page.has_content?("Email can't be blank")
end

# Scenario: First name is empty
# When I did not input first name
# And I should be able to click "submit" button after filling all fields
# Then The page should remind me "First name can't be blank"

When /^I did not input first name$/ do
  fill_in "user_password_confirmation", :with => ""
end

Then /^The page should remind me "First name can't be blank"$/ do
  page.has_content?("First name can't be blank")
end

# Scenario: Middle name is empty
# When I did not input middle name
# And I should be able to click "submit" button after filling all fields
# Then The page should remind me "Middle name can't be blank"

When /^I did not input middle name$/ do
  fill_in "user_password_confirmation", :with => ""
end

Then /^The page should remind me "Middle name can't be blank"$/ do
  page.has_content?("First name can't be blank")
end

# Scenario: Last name is empty
# When I did not input last name
# And I should be able to click "submit" button after filling all fields
# Then The page should remind me "Last name can't be blank"

When /^I did not input last name$/ do
  fill_in "user_password_confirmation", :with => ""
end

Then /^The page should remind me "Last name can't be blank"$/ do
  page.has_content?("First name can't be blank")
end