Given(/^I'm on analyst login page$/) do
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
 end
 
 And(/^Input analyst Email and password$/) do
   fill_in 'Email', with: @user.email
   fill_in 'Password', with: @user.password
 end
 
 When(/^I logn in as an analyst$/) do
   click_button 'Log in'
 end
 
 Then(/^I can see Accepted Articles$/) do
   expect(page).to have_content('Accepted Articles')
 end