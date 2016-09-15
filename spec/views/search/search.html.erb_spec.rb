require 'rails_helper'

RSpec.describe "search/search.html.erb", type: :view do
  it 'displays search details correctly' do
    assign(:search, Search.new(search_fields_attributes: [
        field: 'title',
        op2: 'ILIKE',
        content: 'You'
    ]))

    render

    expect(rendered).to match /You/
  end
end
