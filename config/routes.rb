Rails.application.routes.draw do
  resources :events
  root 'welcome#index'
  resources :events do
    resources :tickets
  end 
  resource :retirements, only: %i[new create]
  get "/auth/:provider/callback", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end