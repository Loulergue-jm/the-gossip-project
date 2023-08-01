Rails.application.routes.draw do
  root 'gossips#index'
  
  get '/root', to: 'gossip#index'
  get '/welcome/:name', to: 'welcome#welcome'
  get '/team', to: 'team#team'
  get '/contact', to: 'contact#contact'
  get '/users/:id', to: 'users#show', as: 'user'
  
  resources :gossips
end
