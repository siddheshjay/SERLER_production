require 'rails_helper'

RSpec.describe EvidenceSourcesController, type: :controller do

  describe "moderator GET #new_submitted" do
  	it "returns http success" do
      sign_in 'moderator@example.com'

      get :new_submitted
      expect(response).to have_http_status(:success)
      expect(response).to render_template("new_submitted")
    end
  end

  describe "analyst GET #accepted" do
  	it "return http success" do
  	  sign_in "analyst@example.com"
  	  get :accepted
  	  expect(response).to have_http_status(:success)
  	  expect(response).to render_template(:accepted)
  	end
  end

  describe "moderator GET #rejected" do
  	it "return http success" do
  	  sign_in "moderator@example.com"
  	  get :rejected
  	  expect(response).to have_http_status(:success)
  	  expect(response).to render_template(:rejected)
  	end
  end

end
