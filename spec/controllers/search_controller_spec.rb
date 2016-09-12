require 'rails_helper'

RSpec.describe SearchController, type: :controller do


  describe "GET #show" do
    it "returns http success with Params" do
      get :show, params:{ "search"=>{"search_fields_attributes"=>{"0"=>{"field"=>"title", "op2"=>"ILIKE", "content"=>"how"}}},"commit"=>"Search"}
      expect(response).to have_http_status(:success)
    end

    it "renders the show template" do
      get :show, params:{ "search"=>{"search_fields_attributes"=>{"0"=>{"field"=>"title", "op2"=>"ILIKE", "content"=>"how"}}},"commit"=>"Search"}
      expect(response).to render_template("show")
    end
  end

  describe "GET #search" do
    it "returns http success" do
      get :search
      expect(response).to have_http_status(:success)
    end

    it "renders the searh template" do
      get :search
      expect(response).to render_template("search")
    end

  end

end
