require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  describe "GET #search" do
    it "returns http success" do
      get :search
      expect(response).to have_http_status(:success)
    end

    it "renders the searh template" do
      get :search
      expect(response).to render_template("search")
    end

    it "returns http success with Params" do
      get :search, params:{ "search"=>{"search_fields_attributes"=>{"0"=>{"field"=>"title", "op2"=>"ILIKE", "content"=>"how"}}},"commit"=>"Search"}
      expect(response).to have_http_status(:success)
    end

    it "renders results if parameters provided" do
      get :search, params:{ "search"=>{"search_fields_attributes"=>{"0"=>{"field"=>"title", "op2"=>"ILIKE", "content"=>"how"}}},"commit"=>"Search"}
      expect(response).to render_template("search")
    end
  end
end
