require 'rails_helper'

RSpec.describe SearchField, type: :model do
  context "Associations" do
    it "Belongs to search" do
      should belong_to(:search)
    end
  end

  context "CRUD" do
    it 'could be created' do
      search_field = FactoryGirl.create(:search_field)
      expect(search_field).to be_valid
    end

    it 'could be updated' do
      search_field = FactoryGirl.create(:search_field)
      search_field.save
      search_field.op2 = 'Allen'
      search_field.save
      expect('Allen').to eq(search_field.op2)
    end

    it 'could be deleted' do
      search_field = FactoryGirl.create(:search_field)
      search_field.save
      search_field_count = SearchField.count
      search_field.destroy
      expect(search_field_count - 1).to eq(SearchField.count)
    end

    it 'could be found' do
      search_field = FactoryGirl.create(:search_field)
      search_field.save
      expect(1).to eq(SearchField.count)
    end

  end
end