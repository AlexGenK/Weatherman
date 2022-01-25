Rails.application.routes.draw do
  root to: 'weather_data#index'
  
  resources :stations
end
