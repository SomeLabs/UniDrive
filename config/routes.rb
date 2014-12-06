Rails.application.routes.draw do

  devise_for :users

  namespace :api do
    namespace :v1 do

    end
  end

  root 'home#index'
  get '*path' => 'home#index'
end
