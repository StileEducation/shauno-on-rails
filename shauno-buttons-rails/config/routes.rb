Rails.application.routes.draw do
  root to: "main#index"

  resources :buttons, except: [:destroy]

  resources :events, except: [:destroy]
end
