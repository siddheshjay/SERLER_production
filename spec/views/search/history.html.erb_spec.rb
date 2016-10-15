require 'rails_helper'

RSpec.describe "search/history.html.erb", type: :view do

  before do
    controller.singleton_class.class_eval do
      protected
      def sort_column
        "title"
      end

      def sort_direction
        "desc"
      end

      helper_method :sort_column, :sort_direction
    end
  end
  it 'displays history correctly' do
    assign(:searches, [Search.create!({
      name: "Test",
      search_fields_attributes: [
        field: 'title',
        op2: 'ILIKE',
        content: 'How'
      ]}
     )
    ])
    render
    expect(response).to match /title/
  end
end
