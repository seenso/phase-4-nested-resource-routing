Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # DOG HOUSES
  resources :dog_houses, only: [:show] do 
    # nested resource for reviews
    resources :reviews, only: [:show, :index]
  end

  # REVIEWS
  resources :reviews, only: [:show, :index, :create]

end
