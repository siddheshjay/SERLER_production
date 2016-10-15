Given(/^I'm logged in as a admin user$/) do
    @user = User.create!({
     email: "user@example.com", password: "123456", password_confirmation: "123456",
     reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1,
     current_sign_in_at: "2015-02-06 14:02:10", last_sign_in_at: "2015-02-06 14:02:10",
     current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", roles_mask: 1,
     first_name: "Fistname", middle_name: "no-middle-name", last_name: "Lastname",
   })
   @user.save!
   visit new_user_session_path
   expect(page).to have_content('Log in')
   fill_in 'Email', with: @user.email
   fill_in 'Password', with: @user.password
   click_button 'Log in'
 end
 
 And(/^I click New Article link$/) do
 	expect(page).to have_content('Title')
 	click_link 'New Article'
 	expect(page).to have_content('NEW EVIDENCE SOURCE')
 end
 
 When(/^I type specific Title year and click submit$/) do
 
   click_button 'add-author'	
   fill_in 'Title', with: 'From CMMI and Isolation to Scrum, Agile, Lean and Collaboration'
   fill_in 'Year', with: '2009'
   fill_in 'Source title', with: 'Communications of the ACM.'
   fill_in 'Publisher', with: 'Google'
   fill_in 'Volume number', with: 100
   fill_in 'Issue number', with: 4
   fill_in 'Page', with: '274a-274a'
   fill_in 'Doi', with: '10.1109/AGILE.2009.18'
   fill_in 'evidence_source[author][]', with: 'Paul Hamilton'
   click_button 'SUBMIT'	
 end
 
 Then(/^we will on the list of submission page$/) do
 end