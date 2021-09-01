Rails.application.routes.draw do
  root to: "main#index"

  resources :buttons

  resources :events
end
