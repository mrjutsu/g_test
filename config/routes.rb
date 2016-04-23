Rails.application.routes.draw do

  resources :messages, only: :create
  resources :categories
  resources :groups

  devise_for :users, controllers: { registrations: 'registrations' }

  devise_scope :user do
    get :sign_up, to: 'devise/registrations#new'
    get :sign_in, to: 'devise/sessions#new'
    get :sign_out, to: 'devise/sessions#destroy'

    root to: 'messages#index'
  end

end
