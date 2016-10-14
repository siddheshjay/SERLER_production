require 'rails_helper'

RSpec.describe EvidenceSourcesController, type: :controller do
  describe "GET #new_submitted" do
  	it "returns http success" do
      sign_in :username

      get :new_submitted
      expect(response).to have_http_status(:success)
    end
  end
end
