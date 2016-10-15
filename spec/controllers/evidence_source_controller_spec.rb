require 'rails_helper'

RSpec.describe EvidenceSourcesController, type: :controller do

  describe "moderator GET #new_submitted" do
  	it "returns http success and renders new_submitted template for moderator" do
      sign_in 'moderator@example.com'

      get :new_submitted
      expect(response).to have_http_status(:success)
      expect(response).to render_template("new_submitted")
    end
  end

  describe "GET #accepted" do
  	it "returns http success and renders the accepted template for analyst" do
  	  sign_in "analyst@example.com"
  	  get :accepted
  	  expect(response).to have_http_status(:success)
  	  expect(response).to render_template(:accepted)
  	end

  	it "returns http success and renders the accepted template for administrator" do
  	  sign_in "admin@example.com"
  	  get :accepted
  	  expect(response).to have_http_status(:success)
  	  expect(response).to render_template(:accepted)
  	end
  end

  describe "GET #rejected" do
  	it "returns http success and renders the rejected template for moderator" do
  	  sign_in "moderator@example.com"
  	  get :rejected
  	  expect(response).to have_http_status(:success)
  	  expect(response).to render_template(:rejected)
  	end

  	it "returns http success and renders the rejected template for administrator" do
  	  sign_in "admin@example.com"
  	  get :rejected
  	  expect(response).to have_http_status(:success)
  	  expect(response).to render_template(:rejected)
  	end
  end

  describe "POST #create evidence source" do
  	it "input new evidence source" do
  		sign_in "user@example.com"

  		post :create, :evidence_source => {
  			:page => '100-108',
  			:title => 'TITLE OF THE ARTICLE',
  			'author[]' => ['J. Wang', 'Rex Wang'],
  		}

  		expect(response).to have_http_status(302)
   	end

  	# it "" do
  	# 	expect {
  	# 		post :createwhat,
  	# 		evidence_source: {
  	# 			:page => '200-250',
  	# 			:title => 'ANOTHER ARTICLE',
  	# 			'author[]' => ['J. Wang', 'Rex Wang'],
  	# 		}
  	# 	}.to change(EvidenceSource, :count).by(1)
  	# end

  end

  describe "POST #research_design" do
  	it "update research_design" do
  	  sign_in "user@example.com", :user
	  post :create, :evidence_source => {
		:page => '100-108',
		:title => 'TITLE OF THE ARTICLE',
		'author[]' => ['J. Wang', 'Rex Wang'],
	  }

  	  sign_in "analyst@example.com", :analyst

  	  esid = EvidenceSource.limit(1)[0].id

  	  post :research_design, :research_design => {
  	  	:evidence_source_id => esid,
  	  	:aim => 'the aim',
  	  	:participants => '',
  	  	:metrics => '',
  	  }

  	  expect(response).to have_http_status(302)
  	end
  end

  describe "POST #evidence_item"
    it "create new evience_item" do
      sign_in "user@example.com", :user
	  post :create, :evidence_source => {
		:page => '100-108',
		:title => 'TITLE OF THE ARTICLE',
		'author[]' => ['J. Wang', 'Rex Wang'],
	  }

      sign_in "analyst@example.com", :analyst
      esid = EvidenceSource.limit(1)[0].id

      post :evidence_item, :evidence_item => {
      	:esid => esid,
      	:eiid => '-1',
      	:benefit => 'benefit',
      	:result => 'result',
      	:ctx_where => 'context-where',
      	:ctx_when => 'context-when',
      	:ctx_how => 'context-how',
      	:ctx_whom => 'context-whom',
      	:ctx_what => 'context-what',

      	'method[]' => '[0]',

      	:submit => 'submit',

        :integrity => '3',
        :rating_tenth => '30',
      }

      expect(response).to have_http_status(302)
    end

    it "create draft evience_item and re-edit it" do
      sign_in "user@example.com", :user
	  post :create, :evidence_source => {
		:page => '100-108',
		:title => 'TITLE OF THE ARTICLE',
		'author[]' => ['J. Wang', 'Rex Wang'],
	  }

      sign_in "analyst@example.com", :analyst
      esid = EvidenceSource.limit(1)[0].id

      post :evidence_item, :evidence_item => {
      	:esid => esid,
      	:eiid => '-1',
      	:benefit => 'benefit',
      	:result => 'result',
      	:ctx_where => 'context-where',
      	:ctx_when => 'context-when',
      	:ctx_how => 'context-how',
      	:ctx_whom => 'context-whom',
      	:ctx_what => 'context-what',

      	'method[]' => '[0]',

      	:draft => 'draft',

        :integrity => '3',
        :rating_tenth => '30',
      }

      expect(response).to have_http_status(302)

      eiid = G2EvidenceItem.limit(1)[0].id
      post :evidence_item, :evidence_item => {
      	:esid => esid,
      	:eiid => eiid,
      	:benefit => 'benefit',
      	:result => 'result',
      	:ctx_where => 'context-where',
      	:ctx_when => 'context-when',
      	:ctx_how => 'context-how',
      	:ctx_whom => 'context-whom',
      	:ctx_what => 'context-what',

      	'method[]' => '[0]',

      	:draft => 'draft',

        :integrity => '3',
        :rating_tenth => '30',
      }

    end
  end

# end
