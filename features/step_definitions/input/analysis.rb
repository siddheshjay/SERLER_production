Given(/^I'm logged in as a admin analyst$/) do
    @user = User.create!({
     email: "analyst@example.com", password: "123456", password_confirmation: "123456",
     reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 4,
     current_sign_in_at: "2015-02-06 14:02:10", last_sign_in_at: "2015-02-06 14:02:10",
     current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", roles_mask: 4,
     first_name: "Fistname", middle_name: "no-middle-name", last_name: "Lastname",
   })
   @user.save!
   visit new_user_session_path
   expect(page).to have_content('Log in')
   fill_in 'Email', with: @user.email
   fill_in 'Password', with: @user.password
   click_button 'Log in'
end

Given(/^There is one accepted article$/) do
  es = EvidenceSource.create(
  {
    status: 'ACCEPTED', submitter_id: 1,
    title: 'From CMMI and Isolation to Scrum, Agile, Lean and Collaboration',
    source_title: 'Agile Conference, 2009. AGILE \'09.',
    year: 2009, volume_number: 33, issue_number: 4,
    page_str: '283-288', page_begin: 283, page_cease: 288,
    DOI: '10.1109/AGILE.2009.18',
    category: 'Academic Journals',
    publisher: 'Elsevier Inc',
    published_time: DateTime.new(2009,10,01),
    rating_tenth: 10,
    research_aim: 'Money',
  })
  es.save!
end

Given(/^I click Accepted Article link$/) do
  click_link 'Accepted Article'
   	expect(page).to have_content('LIST OF ACCEPTED EVIDENCE SOURCES')
end

When(/^I click EDIT$/) do
  click_link 'EDIT'
end

Then(/^I will on edit page$/) do
  expect(page).to have_content('EDIT EVIDENCE SOURCE')
end
