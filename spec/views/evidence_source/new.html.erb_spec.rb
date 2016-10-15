require 'rails_helper'

RSpec.describe "evidence_sources/new.html.erb", type: :view do
  it "shows form with several input elements" do

  	render

  	expect(rendered).to match /SUBMIT BY CITATION/
  	expect(rendered).to match /<button .*Submit BibTeX/
  	expect(rendered).to match /<button .*Submit APA/

  	expect(rendered).to match /<input .* id="evidence_source_title"/
  	expect(rendered).to match /<input .* id="evidence_source_year"/
  	expect(rendered).to match /<input .* id="evidence_source_source_title"/
  	expect(rendered).to match /<input .* id="evidence_source_publisher"/
  	expect(rendered).to match /<input .* id="evidence_source_page"/
  	expect(rendered).to match /<input .* id="evidence_source_DOI"/

  	expect(rendered).to match /<button .*SUBMIT/
  	expect(rendered).to match /<button .*RESET/
  end
end
