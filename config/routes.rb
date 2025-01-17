Rails.application.routes.draw do
  root to: "owners#index"

  resources :owners do
    resources :machines, only: [:index, :show]
  end

  resources :machines, only: [:index, :show]

  resources :snacks, only: [:show]
end
