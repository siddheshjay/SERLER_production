require 'rails_helper'

RSpec.describe Search, type: :model do
  context "Associations" do
    it "Has many search fields" do
      should have_many(:search_fields)
    end
  end
end
