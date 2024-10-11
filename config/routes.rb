Rails.application.routes.draw do
  # Define la ruta principal de la aplicación
  root 'movies#index'

  # Rutas para películas
  resources :movies, only: [:index, :new, :create]

  # Rutas para series
  resources :series, only: [:index, :new, :create]

  # Rutas para documentales
  resources :documentary_films, only: [:index, :new, :create]

  # Rutas adicionales para la salud de la aplicación
  get "up" => "rails/health#show", as: :rails_health_check

  # Rutas para PWA
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end

  
