Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :photos, only: [:new, :create, :index, :edit, :update, :destroy]
  get "photos/download_photo"
  root 'photos#index'
end
