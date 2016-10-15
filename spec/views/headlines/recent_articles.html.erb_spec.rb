require 'rails_helper'

RSpec.describe "headlines/recent_articles.html.erb", type: :view do
  it "shows textarea the the publish button" do

  	user = User.create({
  	  :email => "fake@example.com",
  	  :password => "fakepasswd",
      :first_name => "FN",
      :middle_name => "MN",
      :last_name => "LN",
  	  })
  	user.save!

    assign :recent_evidence_sources, [EvidenceSource.create({
      :title => 'fake title',
      :status => 'PUBLISHED',
      :submitter_id => user.id,
    })]

  	render

  	expect(rendered).to match /RECENT ARTICLES TO INFORM USERS/
  	expect(rendered).to match /<textarea .* id="description"/

    expect(rendered).to match /<button .*id="btn-add-article".*>.*ADD ARTICLES/

  	expect(rendered).to match /<button .*PUBLISH/
  end
end
