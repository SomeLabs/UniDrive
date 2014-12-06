Rails.application.routes.draw do

  devise_for :users

  namespace :api do
    namespace :v1, constraints: { format: 'json' }, defaults: { format: 'json' } do
     devise_scope :user do
        # registrations: 'users/registrations',
        post :login, to: 'sessions#create'
        delete :logout, to: 'sessions#destroy'
      end
    end
  end

  get '/auth/:provider/callback', to: 'social_auth#create'

  root 'home#index'
  get '*path' => 'home#index'
end
