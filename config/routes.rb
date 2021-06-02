Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:index, :show, :update] do
    collection do
      get '/profile' => 'users#profile'
      put '/update_profile' => 'users#update_profile'
    end
  end
  resources :opinions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root "opinions#index"
end
