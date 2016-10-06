Rails.application.routes.draw do
  root to: 'notes#index'

  resources :notes do
    patch :positions, on: :collection
  end
end
