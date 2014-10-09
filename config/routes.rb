Rails.application.routes.draw do
  get 'static_pages/home'

  root 'static_pages#home'

  devise_for :users

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get 'sign_out', to: 'devise/sessions#destroy'
    get 'sign_up', to: 'devise/registrations#new'
  end

  resources :appointments

  resources :users, only: [:destroy]
  get '/account', to: 'users#show'
  get '/account/edit', to: 'devise/registrations#edit'
  get '/client_list', to: 'users#index'
end
