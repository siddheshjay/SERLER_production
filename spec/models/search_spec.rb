require 'rails_helper'

RSpec.describe Search, type: :model do
  context "Associations" do
    it "Has many search fields" do
      should have_many(:search_fields)
    end
  end

  context 'CRUD' do
    it 'could be created' do
      search = FactoryGirl.create(:search)
      expect(search).to be_valid
    end

    it 'could be updated' do
      search = FactoryGirl.create(:search)
      search.save
      search.name = 'Allen'
      search.save
      expect('Allen').to eq(search.name)
    end

    it 'could be deleted' do
      search = FactoryGirl.create(:search)
      search.save
      search_count = Search.count
      search.destroy
      expect(search_count - 1).to eq(Search.count)
    end

    it 'could be found' do
      search = FactoryGirl.create(:search)
      search.save
      expect(1).to eq(Search.count)
    end
  end
end
