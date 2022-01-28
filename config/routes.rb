Rails.application.routes.draw do
  root to: 'weather_data#index'

  resources :dimensions
  resources :stations
end
