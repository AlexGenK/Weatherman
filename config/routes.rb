Rails.application.routes.draw do
  root to: 'weather_data#daily'

  get 'daily', to: 'weather_data#daily'

  resources :dimensions
  resources :stations do
    resources :measurements
  end
end
