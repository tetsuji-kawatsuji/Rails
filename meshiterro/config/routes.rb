Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :post_images, only: [:new, :create, :index, :show]

  root 'post_images#index'

end
