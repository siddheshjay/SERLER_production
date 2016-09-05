require 'rails_helper'

RSpec.describe News, type: :model do
  context 'Associations' do
    it 'Has many notifications' do
      should have_many(:notifications)
    end
  end
end
