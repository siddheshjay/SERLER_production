require 'rails_helper'

RSpec.describe SearchField, type: :model do
  context "Associations" do
    it "Belongs to search" do
      should belong_to(:search)
    end
  end
end
