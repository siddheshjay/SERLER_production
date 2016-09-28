Rails.application.routes.draw do


  match "browse" => "browse#index", via: [:get]

  get 'welcome/landing'
  #root 'welcome#landing'
  get 'evidence_sources/my_submissions'
  get 'evidence_sources/new_submitted'
  get 'evidence_sources/rejected'
  get 'evidence_sources/accepted'
  get 'evidence_sources/published'
  get 'evidence_sources/all'

  resources :evidence_sources

  get 'search/show'
  match 'search' => "search#search", via: [:post, :get]
  root 'search#search'

  resources :methodologies
  resources :se_methods
  resources :evidence_items
  resources :research_methods
  resources :participants
  resources :notifications
  resources :news
  resources :papers
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
