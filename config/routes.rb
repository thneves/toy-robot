Rails.application.routes.draw do
  get "toy_robot/index"
  root to: "toy_robot#index"
end
