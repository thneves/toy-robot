Rails.application.routes.draw do
  resources :robots, only: %w[index new create]

  root to: "robots#index"
end
