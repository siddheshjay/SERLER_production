Rails.application.routes.draw do
  root 'browse#index'
  match "browse" => "browse#index", via: [:get]

  get 'welcome/landing'
  #root 'welcome#landing'
  get 'welcome/admin'
  
  
  get 'evidence_sources/my_submissions'
  get 'evidence_sources/new_submitted'
  get 'evidence_sources/rejected'
  get 'evidence_sources/accepted'
  get 'evidence_sources/published'
  get 'evidence_sources/all'

  post 'evidence_sources/research_design'
  post 'evidence_sources/evidence_item'

  resources :evidence_sources do
    resources :g2_evidence_items
  end
  
  get 'headlines/news', to: 'headlines#news'
  post 'headlines/news', to: 'headlines#create_news'
  get 'headlines/recent_articles', to: 'headlines#recent_articles'
  post 'headlines/recent_articles', to: 'headlines#create_recent_articles'

  get "search/history"
  resources :search do
  end

  resources :methodologies
  resources :se_methods
  # resources :evidence_items
  resources :research_methods
  resources :participants
  resources :notifications
  resources :news
  resources :papers
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
