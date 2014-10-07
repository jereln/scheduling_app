Rails.application.routes.draw do
  root 'appointments#index'

  devise_for :users

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get 'sign_out', to: 'devise/sessions#destroy'
    get 'sign_up', to: 'devise/registrations#new'
  end

  resources :appointments

  get '/account', to: 'users#show'
  get '/account/edit', to: 'devise/registrations#edit'
end
