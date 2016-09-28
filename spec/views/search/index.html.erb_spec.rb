require 'rails_helper'

RSpec.describe "search/index.html.erb", type: :view do
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
  it 'displays search details correctly' do
    assign(:search, Search.new(search_fields_attributes: [
      field: 'title',
      op2: 'ILIKE',
      content: 'You'
    ]))
    render
    expect(rendered).to match /You/
  end

  it 'displays show details correctly' do
    assign(:search, Search.new(search_fields_attributes: [
      field: 'title',
      op2: 'ILIKE',
      content: 'How'
    ]))
    user = User.create!(
      {
        email: "user@example.com", password: "123456", password_confirmation: "123456",
        reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1,
        current_sign_in_at: "2015-02-06 14:02:10", last_sign_in_at: "2015-02-06 14:02:10",
        current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"
      }
    )

    assign(:results, [
        EvidenceSource.new(
        {
          status: 'NEW', submitter_id: user.id,
          title: 'From CMMI and Isolation to Scrum, Agile, Lean and Collaboration',
          source_title: 'Agile Conference, 2009. AGILE \'09.',
          year: 2009, volume_number: nil, issue_number: nil,
          page_str: '283-288', page_begin: 283, page_cease: 288,
          DOI: '10.1109/AGILE.2009.18',
        }),
        EvidenceSource.new(
          {
            status: 'NEW', submitter_id: user.id,
            title: 'From CMMI and Isolation to Scrum, Agile, Lean and Collaboration',
            source_title: 'Agile Conference, 2009. AGILE \'09.',
            year: 2009, volume_number: nil, issue_number: nil,
            page_str: '283-288', page_begin: 283, page_cease: 288,
            DOI: '10.1109/AGILE.2009.18',
          })
    ])
    render
    expect(response).to match /Agile/
  end
end
