Rails.application.routes.draw do
  
  get '/team', to: 'team#team'
  get '/contact', to: 'contact#contact'
  get '/welcome/:name', to: 'welcome#welcome'
  root 'gossip#index'
  get '/root', to: 'gossip#index'
  get '/gossip/:id', to: 'gossip#show', as: 'gossip'
  get '/users/:id', to: 'users#show', as: 'user'
end
