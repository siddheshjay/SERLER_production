require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "returns http success with Params" do
      get :index, params:{ "search"=>{"search_fields_attributes"=>{"0"=>{"field"=>"title", "op2"=>"ILIKE", "content"=>"how"}}},"commit"=>"Search"}
      expect(response).to have_http_status(:success)
    end

    it "renders results if parameters provided" do
      get :index, params:{ "search"=>{"search_fields_attributes"=>{"0"=>{"field"=>"title", "op2"=>"ILIKE", "content"=>"how"}}},"commit"=>"Search"}
      expect(response).to render_template("index")
    end
  end
end
