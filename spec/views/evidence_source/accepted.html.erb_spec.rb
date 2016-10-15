require 'rails_helper'

RSpec.describe "evidence_sources/accepted.html.erb", type: :view do
  it "shows list of accepted articles" do

  	user = User.create({
  	  :email => "fake@example.com",
  	  :password => "fakepasswd",
      :first_name => "FN",
      :middle_name => "MN",
      :last_name => "LN",
  	  })
  	user.save!

    assign :evidence_sources, [EvidenceSource.create({
    	:title => 'fake title',
    	:status => 'ACCEPTED',
    	:submitter_id => user.id,
    	})]

  	render

    expect(rendered).to match /LIST OF ACCEPTED EVIDENCE SOURCES/
    expect(rendered).to match /<a .*href="\/evidence_sources\/[0-9]+\/edit".*EDIT/
  end
end
