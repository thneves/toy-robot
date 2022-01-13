Rails.application.routes.draw do
  resources :robots do
    collection do
      post :move_robot
      post :left
      post :right
    end
  end

  root "robots#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
