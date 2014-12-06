Rails.application.routes.draw do

  namespace :api do
    namespace :v1, constraints: { format: 'json' }, defaults: { format: 'json' } do
      devise_for :users, controllers: {
        # registrations: 'users/registrations',
        sessions: 'api/v1/sessions'
      }
    end
  end

  get '/auth/:provider/callback', to: 'social_auth#create'

  root 'home#index'
  get '*path' => 'home#index'
end
