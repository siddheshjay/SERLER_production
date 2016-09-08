Rails.application.routes.draw do
  get  'search/search'
  post 'search/show'

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
