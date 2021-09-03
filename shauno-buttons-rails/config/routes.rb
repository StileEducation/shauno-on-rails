Rails.application.routes.draw do
  root to: "main#index"

  resources :buttons, except: [:destroy]

  resources :reasons, except: [:edit, :update, :destroy]

  resources :developers, except: [:edit, :update, :destroy]

  resources :events, except: [:destroy]
end
