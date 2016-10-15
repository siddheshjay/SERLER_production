require 'rails_helper'

RSpec.describe HeadlinesController, type: :controller do
  describe "GET #news" do
    it "show CREATE NEWS page" do
      sign_in "admin@example.com", :administrator
      get :news
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create_news" do
    it "" do
      sign_in "admin@example.com", :administrator
      post :create_news, :news_body => "the news body"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #recent_articles" do
    it "shows CREATE RECENT ARTICLES page" do
      sign_in "admin@example.com", :administrator
      get :recent_articles
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create_recent_articles" do
    it "" do
      sign_in "admin@example.com", :administrator
      post :create_recent_articles, :description => "the desccription", :articles => {
      	"0" => {
      	  :aid => 0,
      	  :title => "title of the published article"
      	}
      }
      expect(response).to have_http_status(:success)
    end
  end
end
