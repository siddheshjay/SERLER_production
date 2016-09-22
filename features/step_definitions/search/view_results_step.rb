Given(/^There is an login page$/) do
  visit '/users/sign_in'
end

Then(/^I can view it$/) do
  expect(page).to have_content 'Log in'
end
