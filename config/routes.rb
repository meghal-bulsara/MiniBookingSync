Rails.application.routes.draw do
  namespace :api do
    namespace :v1, format: 'json' do
      resources :rentals
      resources :bookings
    end
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
