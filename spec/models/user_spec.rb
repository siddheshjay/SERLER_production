
require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Associations' do
    it 'Has many papaers' do
      should have_many(:papers)
    end

    it 'Has many notifications' do
      should have_many(:notifications)
    end

    it 'Has many news' do
      should have_many(:news)
    end
  end

  context 'CRUD' do
    it 'could be create' do
      user = FactoryGirl.create(:user)
      expect(user).to be_valid
    end
  end
end
