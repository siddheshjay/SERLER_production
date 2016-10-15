require 'rails_helper'

RSpec.describe "headlines/news.html.erb", type: :view do
  it "shows form with several input elements" do

  	render

  	expect(rendered).to match /NEWS TO INFORM USERS/
  	expect(rendered).to match /<textarea .* id="news-body"/

  	expect(rendered).to match /<button .*PUBLISH/
  end
end
