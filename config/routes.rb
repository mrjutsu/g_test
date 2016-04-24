Rails.application.routes.draw do

  resources :profiles, only: :show

  resources :messages, only: [:new, :create, :index]

  resources :categories

  resources :groups do
    member do
      post :join, to: 'groups#join'

      delete :leave, to: 'groups#leave'
    end
  end

  devise_for :users, controllers: { registrations: 'registrations' }

  devise_scope :user do
    get :sign_up, to: 'devise/registrations#new'
    get :sign_in, to: 'devise/sessions#new'
    get :sign_out, to: 'devise/sessions#destroy'

    root to: 'devise/sessions#new'
  end

end
