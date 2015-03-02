Rails.application.routes.draw do
  root 'read#index'

  match 'read',          to: 'read#index',   via: [:get]
  match 'read_confirm', to: 'read#confirm', via: [:post,:get]

  resources :names
end
