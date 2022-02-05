Rails.application.routes.draw do
  root to: 'weather_data#daily'

  get 'daily', to: 'weather_data#daily'
  get 'weekly', to: 'weather_data#weekly'
  get 'monthly', to: 'weather_data#monthly'
  get 'yearly', to: 'weather_data#yearly'

  resources :dimensions
  resources :stations do
    resources :measurements
  end
end
