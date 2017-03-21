Rails.application.routes.draw do

  resources :parks

  root 'welcome#index'
  # need the #index to route to root
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
