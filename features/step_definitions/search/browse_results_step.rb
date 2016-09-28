Given(/^There are (\d+) papers in DB$/) do |arg1|
  @user = User.create!({
    email: 'admin@admin.com',
    password: '12345678',
    password_confirmation: '12345678'
  })
  arg1.to_i.times do |i|
    EvidenceSource.create!(
    {
      status: 'NEW', submitter_id: 1,
      title: 'From CMMI and Isolation to Scrum, Agile, Lean and Collaboration',
      source_title: 'Agile Conference, 2009. AGILE \'09.',
      year: 2009, volume_number: nil, issue_number: nil,
      page_str: '283-288', page_begin: 283, page_cease: 288,
      DOI: '10.1109/AGILE.2009.18',
    })
  end
end

When(/^I visit browse page$/) do
	visit browse_path
end

Then(/^I can see (\d+) papers on page$/) do |arg1|
	expect(page).to have_content("Agile Conference, 2009. AGILE", count: 3)
end
