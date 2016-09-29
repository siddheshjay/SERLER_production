

Then(/^I click 'Search History' link and input 'Search name'$/) do
  expect(page).to have_button("Save Search")
  within(".button-group") do
    click_button 'Save Search'
  end
  fill_in 'saved_search_name', with: 'Test1'
  click_link 'save_search_link'

end

Then(/^When I I click 'Search History', I am on history page and can see the item in a tabular form$/) do
  click_link 'search_history'
  expect(page).to have_content('Test1')
end

Then(/^I click 'Excute Search' and get the result$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
